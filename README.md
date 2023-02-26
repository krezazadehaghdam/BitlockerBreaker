# BitlockerBreaker
Break the bitlocker encrypted partition

# About:
Microsoft has built a feature called BitLocker into its Windows operating system, with the help of which users can encrypt the partitions of their operating system. This feature can have many security benefits and can be used at organizational levels as well. Unfortunately, Microsoft's Windows operating system has many structural weaknesses and still has, and BitLocker's structural weakness can be a clear example of this. Although BitLocker in the new version of Microsoft's Windows 11 has many security improvements, including the use of TPM and Secure Boot, it still has this structural weakness and can cause security problems. When we try to encrypt our partition using BitLocker, we must consider a strong password for it to start the encryption process. Also, along with this password that the user enters, Microsoft also provides a Recover Key to access the encrypted partition. If the user forgets the password, with this Recover Key, the encrypted partition can be decrypted and the information can be accessed. had As a result, the encrypted partition can be recovered using the following two methods:
1. Password set by the user
2. Recover key defined by Microsoft

Structural weakness appears exactly here. The password set by the user is not known due to the fact that it is not clear what pattern it has and what combination of characters is used, and also the length of the password set by the user is not known, so it will be very difficult to perform guessing attacks on the password set by the user. .
On the other hand, the recover key defined by Microsoft has a specific pattern and structure as follows:

XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX-XXXXXX

In fact, the Recover Key defined by Microsoft is 48 characters long, all of which include numbers. So the work became much easier.
Now, if we intend to generate a list of Recover Keys with this existing pattern, we actually need 5852 PB of storage space to be able to create and maintain all the recovery keys that Microsoft produces based on its own pattern. 

![ScreenShot](https://raw.githubusercontent.com/ksrvco/BitlockerBreaker/main/Screenshot/csh.png)

By doing this we will be able to restore all BitLocker encrypted partitions and decrypt them. To do this we need a tool that I coded and shared using Bash Script.
Preparing a storage space of 5852 PB can be impossible for ordinary people and even hackers, but naturally it is not a difficult task for governments and governing bodies, so breaking encryption done by BitLocker is not a difficult task for governments.


# Screenshot:
![ScreenShot](https://raw.githubusercontent.com/ksrvco/BitlockerBreaker/main/Screenshot/Screenshot.jpg)


This is a sample tool only for my research.
