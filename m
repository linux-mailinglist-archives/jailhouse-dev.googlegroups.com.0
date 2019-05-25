Return-Path: <jailhouse-dev+bncBCDJXM4674ERBK4JU3TQKGQEVX7EGLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id D56DE2A5FA
	for <lists+jailhouse-dev@lfdr.de>; Sat, 25 May 2019 20:08:44 +0200 (CEST)
Received: by mail-oi1-x238.google.com with SMTP id k63sf2697994oih.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 25 May 2019 11:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hhhRSbJ410mRY6wJfyyygwzRbGJcW68rbHpWXe9Qagw=;
        b=Dg0wz+RTfXLkjf8UTHg/Chr6BYwJ413RrjTArS0/U+CQtbRt9ATCgFopMROSlkYq38
         BrKeoNDZth6kW7G5xvVGq9NscxNqIzpKwS8sxO+IDb0tVhAz6LD29rF2RX8AunuI1cWL
         954UimtMgAFaWaA7cXnI/o5mfQmF5gD01Ty/0iDqKoyExI4AAzlCEvPKjiYrUBOi0g5u
         hXyMIdPpmYQX6wJKZD/bk/Jo22SFDnOiTpa948rnvrjaLIz3xXXEOO5NNdO1AFGnX1Uk
         mumgxNwMtcoMWLZU5GiTrPbR9TrXGOjItIFDJ/lqAdDzIa8yoBoVMx0G6BdHbfVSxhpo
         2iCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hhhRSbJ410mRY6wJfyyygwzRbGJcW68rbHpWXe9Qagw=;
        b=VKomCKWAX881kOI7vfwUntnLo6uFp/CmEAQP66aBFhgmcCFt1G6baayVMz4QtqscfJ
         BsDCxtENkfydRN9P+RtCLV6wB4joPMeLt/Mx2nVc5MtkayBUzbZwX+jQRIOzK2T7Pkqs
         ZT/kLcSA1Xp0PED5vhiqbmGtgKBrpRwxRV0F2LSNnGH3M7sWAjMcm60eFk+TkCROyKkf
         /BCDVm2GhIrLPIP5NZ9/S/IEaLqwcAURDR1Fy8MHf+d6w14+0GvtOY/62BYzhxFOKj8c
         tAiJD7+VxDDVgxI2Od7Q4nR3E7sEVsHPICQQ76WzZiV6lrQkAirdi0XlKL0gcfGsRjS+
         LNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hhhRSbJ410mRY6wJfyyygwzRbGJcW68rbHpWXe9Qagw=;
        b=j9odTTyfpbN9MqKxFNkrjqiL6CNqOWjjA+Wl6HuXOBziOte5c3KDLB0B67sjB+EUyM
         stTtiR8ZokQSrbRDBnR3ukHi7IOE7bo7CYYi8xScBVA+ZW8SIYnjbwOh0NToLUhO7HZS
         DwTz/zK82EmyFv94BNuXGOuB4L3RU2DFAB9HO5YXnd1uLx6hwoJ2YrV5rRj5KAtKZe1a
         NpNc3UttodV5/kSfTIabRxBoiBrvK08yTfp41NKbA5QZnfZ4wPaQnWHALJL6p/4UuoD8
         9bF9qBstCSpt6xSw9ndtERLzpR+m2BHPhMUZbeiTqJoE7xANDHQjdZ06A0QRHrx7hO/e
         HBtA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWTjm2nveKPPL0y6FUMbMafp13s4E6dHnxJk5lAwMNcQ6yB5EoM
	C7k3kwXnouEB5Smk4CHFa+I=
X-Google-Smtp-Source: APXvYqzhJJ9579dh/BpyXm1E6HqP4ExxYW+kszlLtOOWV/HtVxCzpTp9lvbulUV0t0cYg3SueNBVOw==
X-Received: by 2002:a05:6830:154c:: with SMTP id l12mr13901396otp.66.1558807723568;
        Sat, 25 May 2019 11:08:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:774d:: with SMTP id t13ls2290282otl.6.gmail; Sat, 25 May
 2019 11:08:43 -0700 (PDT)
X-Received: by 2002:a9d:2c2a:: with SMTP id f39mr65311299otb.67.1558807722996;
        Sat, 25 May 2019 11:08:42 -0700 (PDT)
Date: Sat, 25 May 2019 11:08:42 -0700 (PDT)
From: michael.g.hinton@gmail.com
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ab96b376-b73c-463d-90fe-2bbac88cc035@googlegroups.com>
In-Reply-To: <945f6563-0e61-4d00-8ec0-415b27df174a@googlegroups.com>
References: <11b39fc2-5d7b-4118-a265-cba7558fb6f3@googlegroups.com>
 <1839f769-4d27-3e6f-af6d-edb8ec9ee478@siemens.com>
 <69e728e8-c543-4bb1-8c34-5db36e04d1cc@googlegroups.com>
 <2dce448e-a8ff-b7c4-dc76-52a193dacd55@siemens.com>
 <82eae47c-fb7a-40a5-aa48-6f123d97597e@googlegroups.com>
 <20190206135906.7ad04428@md1za8fc.ad001.siemens.net>
 <a9691b13-c868-42cb-a42e-0a09ffc9d7cc@googlegroups.com>
 <20190208164015.2d9a3ee7@md1za8fc.ad001.siemens.net>
 <eed22d42-114d-4f59-8c9d-6749a62e0674@googlegroups.com>
 <6b032366-4973-48ee-bb6d-eeb9a8f8af0a@googlegroups.com>
 <945f6563-0e61-4d00-8ec0-415b27df174a@googlegroups.com>
Subject: Re: How do I get ivshmem-demo working with Jailhouse Images?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1332_101716046.1558807722273"
X-Original-Sender: Michael.G.Hinton@gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_1332_101716046.1558807722273
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Saturday, May 25, 2019 at 12:00:15 PM UTC-6, michael...@gmail.com wrote:
> On Thursday, May 23, 2019 at 3:55:24 AM UTC-6, jeanne....@gmail.com wrote=
:
> > Le samedi 9 f=C3=A9vrier 2019 06:26:29 UTC+1, michael...@gmail.com a =
=C3=A9crit=C2=A0:
> > > On Friday, February 8, 2019 at 8:40:18 AM UTC-7, Henning Schild wrote=
:
> > > > Am Thu, 7 Feb 2019 16:53:41 -0800
> > > > schrieb <michael.***@gmail.com>:
> > > >=20
> > > > > On Wednesday, February 6, 2019 at 5:59:09 AM UTC-7, Henning Schil=
d
> > > > > wrote:
> > > > > > Am Tue, 5 Feb 2019 19:25:28 -0800
> > > > > > schrieb <michael.***@gmail.com>:
> > > > > >  =20
> > > > > > > On Friday, February 1, 2019 at 12:32:40 AM UTC-7, J. Kiszka
> > > > > > > wrote: =20
> > > > > > > > You likely want
> > > > > > > > https://github.com/siemens/linux/commits/jailhouse-enabling=
/4.14
> > > > > > > > or the 4.19-variant that is jailhouse-prepared. That's what
> > > > > > > > jailhouse-images is building for you. If you just rebuild t=
he
> > > > > > > > kernel that the original image was using, only adding UIO, =
you
> > > > > > > > should be fine with keeping the jailhouse kernel package
> > > > > > > > untouched. But the cleanest way is reproducing the image vi=
a
> > > > > > > > jailhouse-images after adjusting the parameter you want to
> > > > > > > > change (CONFIG_UIO, ROOTFS_EXTRA etc.).
> > > > > > > >=20
> > > > > > > > Jan
> > > > > > > >=20
> > > > > > > > --=20
> > > > > > > > Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> > > > > > > > Corporate Competence Center Embedded Linux   =20
> > > > > > >=20
> > > > > > > That worked! I was able to figure out the correct kernel to b=
uild
> > > > > > > by looking at
> > > > > > > jailhouse-images/recipes-kernel/linux/linux-jailhouse.bb from
> > > > > > > when I last generated my image at 4.14.73
> > > > > > > (https://github.com/siemens/linux/archive/1dd68658b3a8308a160=
b0786fc4e1e04d8ff5216.tar.gz).
> > > > > > > With that, I supplied QEMU with the new UIO-enabled kernel im=
age
> > > > > > > and built jailhouse and uio_ivshmem.ko and ran the ivshmem
> > > > > > > jailhouse demo.
> > > > > > >=20
> > > > > > > However, I'm still not sure how to read in the data from the
> > > > > > > ivshmem-demo. Once I insmod uio_ivshmem.ko, shouldn't there b=
e a
> > > > > > > device called /dev/uio0 that I can read "Hello From IVSHMEM" =
from
> > > > > > > and write back to? And shouldn't there be an entry
> > > > > > > in /sys/class/uio/? I don't see either of these, and I'm not
> > > > > > > quite sure how to debug this yet. =20
> > > > > >=20
> > > > > > Yes you should get that. If you do not, my first guess would be=
 that
> > > > > > you are not building the jailhouse branch of the guest-code rep=
o.
> > > > > > The jailhouse version of the PCI interface is slightly differen=
t,
> > > > > > so the probing between the two is not compatible. =20
> > > > > Shouldn't I see /dev/uio0 and /sys/class/uio/ once I `insmod` it,
> > > > > regardless if it's built against a non-jailhouse-enabled kernel? =
Or
> > > > > will it show up once jailhouse is running?
> > > >=20
> > > > I am not actually sure what will happen, so if a /dev/uio0 will pop=
 up
> > > > even if probing failed.
> > > > Just to clarify, i did not talk about a jailhouse enabled kernel, i
> > > > talked about checking out the jailhouse branch of the repo you got =
the
> > > > uio driver from. The one from branch "master" will not work!
> > >=20
> > > Thanks! That's just what I needed. I didn't realize that there was a =
jailhouse branch. I rebuilt it, /dev/uio0 shows up, and the ivshmem-demo is=
 working! uio_read and shmem_test.py (README.jailhouse) both work great.
> > >=20
> > > But unfortunately uio_send doesn't. When I run `uio_send /dev/uio0 1 =
0 0`, it fails to mmap() with an ENODEV/"No such device" error. The mmap ma=
n page says "the underlying filesystem of the specified file does not suppo=
rt memory mapping."
> > >=20
> > > Do you know why this is? Isn't uio_send just trying to mmap() the PCI=
 config space (the first 256 bytes)?
> > >=20
> > > Thanks,
> > > -Michael
> > >=20
> > > >=20
> > > > Henning
> > > >=20
> > > > > When I `make` uio_ivshmem, it shows that it's entering the correc=
t
> > > > > kernel source. Is https://github.com/siemens/linux/commit/1dd6865=
8b
> > > > > not the correct jailhouse-enabled source to build for 4.14.73?
> > > > >=20
> > > > > Does making all the UIO modules be built-in (Y) instead of (M) ma=
ke
> > > > > any difference? I set them to Y because I thought it would make
> > > > > things easier.=20
> > > > >=20
> > > > > I may consider upgrading jailhouse images to the latest if I can'=
t
> > > > > get things working.
> > > > >=20
> > > > > Thanks,
> > > > > Michael=20
> > > > > >=20
> > > > > > Henning
> > > > > >  =20
> > > > > > > The only documentation I can find on this is
> > > > > > > https://www.kernel.org/doc/html/v4.18/driver-api/uio-howto.ht=
ml.
> > > > > > >=20
> > > > > > > Any help is appreciated. Sorry to be a bother. Thanks!
> > > > > > > -Michael
> > > > > > > =20
> > > > >
> >=20
> > Hi Michael,
> >=20
> > I am in the same situation as you with the "no such device" during the =
mmap. Were you able to solve your problem? If so, how?=20
> >=20
> > Best regards,=20
> >=20
> > Jeanne
>=20
> Hello,
>=20
> Sorry, I wasn't able to fix it 100%, at least for the registers.=20
>=20
> I tried mmapping the first page of uio0 for the registers like this:
>=20
>     static const char *UIO_FILE =3D "/dev/uio0";
>     static const char *RES_0_FILE =3D "/sys/class/uio/uio0/device/resourc=
e0";
>=20
>     // Get the page size of the system (usually 4096)
>     PAGESIZE =3D sysconf(_SC_PAGESIZE);
>=20
>     // Open the files
>     uio0_fd =3D open(UIO_FILE, O_RDWR);
>     res0_fd =3D open(RES_0_FILE, O_RDWR);
>=20
>     if (uio0_fd =3D=3D -1) {
>         printf("ERR %d: %s\n", errno, strerror(errno));
>         exit(-1);
>     }
>     if (res0_fd =3D=3D -1) {
>         printf("ERR %d: %s\n", errno, strerror(errno));
>         exit(-1);
>     }
>     printf("Trying to mmap registers from %s\n", UIO_FILE);
>     registers =3D (unsigned int *) mmap(NULL, PAGESIZE, PROT_READ|PROT_WR=
ITE, MAP_SHARED, uio0_fd, PAGESIZE*0);
>     if (registers =3D=3D (void *) -1) {
>         printf("registers mmap failed for %s (%p)\n", UIO_FILE, registers=
);
>         printf("ERR %d: %s\n", errno, strerror(errno));
>=20
>         // Try again, but this time use the resource 0 version
>         // This call succeeds in QEMU Jailhouse Image, but not on Inspiro=
n
>         printf("Trying to mmap registers from %s\n", RES_0_FILE);
>         registers =3D (unsigned int *) mmap(NULL, PAGESIZE, PROT_READ|PRO=
T_WRITE, MAP_SHARED, res0_fd, PAGESIZE*0);
>         if (registers =3D=3D (void *) -1) {
>             printf("registers mmap failed for %s (%p)\n", RES_0_FILE, reg=
isters);
>             printf("ERR %d: %s\n", errno, strerror(errno));
>             exit(-1);
>         }
>     }
>=20
> Mapping /dev/uio0 worked in the QEMU image built by Jailhouse, but not on=
 my x86-64 Dell Inspiron laptop.
>=20
> I tried to get around this by mmapping /sys/class/uio/uio0/device/resourc=
e0 instead, which mmap()s successfully on the Inspiron, but it didn't seem =
to read/write to the registers at all. So I don't think that will work. But=
 maybe you'll have better luck.
>=20
> Of note, I also wasn't able to listen to interrupts in Inspiron by readin=
g /dev/uio0, but that could be due to a bad configuration.
>=20
> In both QEMU and on the Inspiron, though, I was still able to mmap the sh=
ared memory page like this, which was the most important thing for me:
>=20
>     // Get the shared memory at +PAGESIZE offset of /dev/uio0
>     shmem =3D (unsigned int *) mmap(NULL, PAGESIZE, PROT_READ|PROT_WRITE,=
 MAP_SHARED, uio0_fd, PAGESIZE*1);
>     if (shmem =3D=3D (void *) -1) {
>         printf("shmem mmap failed (%p)\n", shmem);
>         printf("MGH: ERR %d: %s\n", errno, strerror(errno));
>         exit(-1);
>     }
>     printf("shmem mmap succeeded! Address:%p\n", shmem);
>=20
> Since I was able to at least get this working, I didn't care too much abo=
ut accessing the registers or getting interrupts to work.
>=20
> I adapted this last snippet to Python 3 (inspired by shmem_test.py):
>=20
>     import mmap
>     PAGE_SIZE =3D 4096
>     device_file =3D '/dev/uio0'
>     f =3D open(device_file, 'r+b')
>     shmem =3D mmap.mmap(f.fileno(), PAGE_SIZE, offset=3DPAGE_SIZE)
>     print("Shmem content (first 30 bytes): '%s'" % shmem.read(30))
>     print("This also works: '%s'" % shmem[0:30].hex())
>=20
>     str_bytes =3D bytearray("Hello from root", 'utf-8')
>     str_bytes_len =3D len(str_bytes)
>     shmem[0:str_bytes_len] =3D str_bytes
>=20
> This is a lot more convenient for rapid prototyping (This is condensed fr=
om my actual script, so hopefully it doesn't err. But it should be mostly c=
orrect).
>=20
> Hope that helps,
> -Michael

Sorry, I think I mixed up the file names. Apparently /sys/class/uio/uio0/de=
vice/resource0 mmapped successfully in QEMU, but NOT on Inspiron.

At any rate, IIRC I don't believe I was able to access the registers  (door=
bell, etc.) in either. If you make any progress out on this end, please let=
 me know. Thanks!=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ab96b376-b73c-463d-90fe-2bbac88cc035%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1332_101716046.1558807722273--
