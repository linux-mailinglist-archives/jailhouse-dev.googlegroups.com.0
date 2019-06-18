Return-Path: <jailhouse-dev+bncBCC7DQPESQPRBUMPUTUAKGQEOXLUWVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 839AE4A5CD
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 17:48:35 +0200 (CEST)
Received: by mail-pf1-x43b.google.com with SMTP id y7sf9552223pfy.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 08:48:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560872914; cv=pass;
        d=google.com; s=arc-20160816;
        b=KABrXoPg1sJ2sCiCd5jfVJN23uiAQOuJQUFje+hlGomEViPZUqmhToOasSLcawki11
         UFaEuurvXJYblReJcKBWomQSOtxZ/3bOFOyiHC3iljk0XhXWzmXJsID6QeZmuUMyX52/
         b5fqKRoROC0eGzPn6icGR/a5xNjJT6ZfNvYi2MLlKpiLiAyzz4BiHOdNEeRGGLawBJk7
         qWjBV15Juc+1jHEvcgnxUUhISv0tfs6gW2yA9xujitPxYkCVTPDVCStC2Ci9TeAXwetx
         oVRGin58Z7vo8I9Go0U9a0JHJQDokE6XYv0hkhDBWI5Tg3Q6MYU5dX+E0KGTptY0iKQq
         Iobg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=SKLaierTJe3cju09CCEmaMiMjzNekKbxvoivb3Sth8w=;
        b=fAZSY7RZ0UoJK6bliSsKYx6tsA61xN224wuBa+nI0toS8MMlg/M2uS35MWttprOZVL
         ArJaUospxhqL3Qj4EN+kRz/F8yOYvpMZcrTtLngcYXKYbBoEaBJUenGwfZ/sCzc3G809
         Yv012mYSrcGpIy7jO6F2PB3UgI+gTFYztXLmQW8noMCgtB2WsU0DDAT6izpHWSbe+Glo
         1mjrZ2LAHqkaSdoPSk21GVuLkIjNKuxk2nnq9rlpVvBeyAWMWpQ4P/5YtrYOn276edpb
         CLkuxAp3+TETJoxw8dvz6XnBGkgD7D4LYh9vufIDCFViwXjNLiuxY1cQvk4RppMo9yov
         GN8A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="PBb6T/fx";
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::843 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SKLaierTJe3cju09CCEmaMiMjzNekKbxvoivb3Sth8w=;
        b=JSgVh2xPtJLD/HbrUT0ImONRYr0utrDNoya5Z6LtZHC5cuC8K/XjF354YZN/pfbd+a
         9MnGxKi+/BLfebJWiX/CDfYCNu/q6lHqRVv7RYx4cO7//MDTMBMkt4QhOpdI8+T2GNxJ
         oN0vXcU14XwOWDiDdIvovClj8iH4UFAE64U7knVz54qJ1A0lD87G8SHNagh63UbDngFz
         35Ur5SI3U9JFNOw/TfOR1jGfJv9Qypubf9k1GuiyUbMIxY3JZcHLxO14yhcTzcv05ZtR
         K9V+0ff/vVC8Vfia0KPsG1FNHmOCZue6NNCo3e4xfbqSOHl0uvWgWDMavaaOsYSDHoOl
         XriA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SKLaierTJe3cju09CCEmaMiMjzNekKbxvoivb3Sth8w=;
        b=R/IbXS4etF4kck06AEi7ryEa//85HSRzxlssL5Xf02DbPKXY1CH0eSZypTeNGgfZ+b
         lWSXGVCUORZ7HfDuNze/44C+igOFcACbpfJbU4YcXJ0zDZh26r2TOcymsWwx8F0WmwDs
         YGUeXj6ydsl1bRtvHzpvf5unWnNmOud+evwzJQc/7fHGRBkIi21vjtumUh3wkv5tmEK1
         6eiy/MHhAH0NLOekqeavu+dr+khAnjO01vlrDZoxyp6hxpXUz40DPPnTOgT8hzl8OFPQ
         WJXok/gVW7+Hm1pTaFSJZ3DzF7xrbLhbUGMgumTjkPF0D9u/ek6NHmo+pZXNaO7VW8qU
         ELug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SKLaierTJe3cju09CCEmaMiMjzNekKbxvoivb3Sth8w=;
        b=tJsr1fU2Wpq7pPMLXolfxvN9RIJ61uugBTudgOLfVm+0smghqiscuz1yx+t/rp47bB
         6ldRDJeBLSjSe/WvUZv//RbP2o52OgJGYtRZWBOd2LNUAmkWD0HrAUx2GyLLcd6UoPCJ
         Bw8rEKNczVX/FiuNkB+ZmQG0YMPGBmRx2ACMGsODDqDaZgqKYvQYgyQa7A6+Ws/4ZI24
         GXpSyDL96BKxQASHJlkKmVNJGReZuEanI/rMI3yMGoIyMvZeYUnvagwv4aLEsgma9PE/
         hV0wZk3HYzwnqWkElyW6N1W20D0HDuyS18oL/rjnl8DLDiCoZY83asTI/CRKJt2/wa2P
         fTWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW6znug078laP91hX7o+IwUF9Vo9lTwmZjXo5AUL3/dW0mCaSMX
	DDKF+KnPksgamXj5h96jI/k=
X-Google-Smtp-Source: APXvYqy4l6RWSt0/TqIm852ZBZJsnZTomp7e6Or9IrzKj4UI+qojHG0gy0xYyDGbFQNwd20CcUBRQg==
X-Received: by 2002:a17:90a:d14a:: with SMTP id t10mr5878700pjw.85.1560872914162;
        Tue, 18 Jun 2019 08:48:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:8609:: with SMTP id f9ls4944741plo.7.gmail; Tue, 18
 Jun 2019 08:48:33 -0700 (PDT)
X-Received: by 2002:a17:90a:7184:: with SMTP id i4mr5929276pjk.49.1560872913666;
        Tue, 18 Jun 2019 08:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560872913; cv=none;
        d=google.com; s=arc-20160816;
        b=uwVcmnsZvjC32oOF7J5hAZh3rY8EIZILiEil2hQ2veEGQTbRQwM1THaooNXazCLvmO
         FebA7vJ3pzSRYpG6EvNHfOFrwHuykdU4nmrA5WFI5qc1Z5BRlj2xyGEmNL+Ozhy8KeS2
         1k4+BFlEU2Ce8Y9Pqy6/xKCnE9F57QoyjacN9T2aarkiK1R00wM9GXlvNS3vE8L97pMD
         pkrAr9PNT4JWuPL7PNP3zFdIM/jR+TizGuUitjhZOAda3Jx9wHSWIKHTXoR/hGW7YiIP
         X20dTl7RR+hWhQx5m8SnGotiUiKR9XUDiKPuQO9AHVjh1chltpLPHuXfMxYzNKLHutxG
         x/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RNR8tj1mQv89ea4WG6JKeiKPwvD3zRoaQ1rTgb8brcw=;
        b=R94Iv5TcpxA0MzBX2zWLlsJoxtjYsX6WRt7rVuqCZdlLVCqoDL07CXt8dRMPBrohQD
         jomnt3hae0RNLXlDP54gsqKQ2HIy7/Z00W7aCrHPsXdua8djlIAioba7hpPrjrfVtdkI
         ryEfbtu+Zn0XRRC+XqJrxbTQ0y0ZXTfFI8lCudBZRz+pyYVQqr0u8yr1+s7DM1UHTyRc
         mL0hAHfxFMAFTG1xddp6XAmHxGCt8+0ormJRAKJkYspNhWNa8wzbiyDnDyZp3ahFXg84
         N37ffy0u1xG9AJUMunSz9f3suY+6R4J6Vry5nuFT9JRkKXAZZ83jzzcMGVxyMlqyls0I
         tqkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="PBb6T/fx";
       spf=pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::843 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com. [2607:f8b0:4864:20::843])
        by gmr-mx.google.com with ESMTPS id s125si873168pgs.1.2019.06.18.08.48.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Jun 2019 08:48:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::843 as permitted sender) client-ip=2607:f8b0:4864:20::843;
Received: by mail-qt1-x843.google.com with SMTP id s15so15877570qtk.9
        for <jailhouse-dev@googlegroups.com>; Tue, 18 Jun 2019 08:48:33 -0700 (PDT)
X-Received: by 2002:a0c:b010:: with SMTP id k16mr28250403qvc.170.1560872912806;
 Tue, 18 Jun 2019 08:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <42ce8fed-792a-ac86-7611-ee9b13dd7815@oth-regensburg.de> <CA++Khc13nuahbog_WVD-BJi0asHEa8TxMAvB5M5damJGJ_5inA@mail.gmail.com>
 <d2e2b271-4e43-4126-5433-8304d4984e7a@oth-regensburg.de> <CA++Khc2LGq3gGydG2Ojxn2xcbPoc6VzvhoO4_ikFMFMdQ_aYOg@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com> <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com> <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com> <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com> <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com> <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
 <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com>
In-Reply-To: <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com>
From: Wayne <racedrive1503@gmail.com>
Date: Tue, 18 Jun 2019 11:48:21 -0400
Message-ID: <CA++Khc2-Cv==+eJCS8cN-ShK7q==Qs7UpW-ZfoUcEZ2Tam5c7Q@mail.gmail.com>
Subject: Re: Linux non-root node question
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000081e52c058b9b0b17"
X-Original-Sender: racedrive1503@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="PBb6T/fx";       spf=pass
 (google.com: domain of racedrive1503@gmail.com designates 2607:f8b0:4864:20::843
 as permitted sender) smtp.mailfrom=racedrive1503@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--00000000000081e52c058b9b0b17
Content-Type: text/plain; charset="UTF-8"

Jan/Ralf:

Ok, with the rootfs.cpio you just provided I can see the following on my
serial port:

Welcome to Buildroot
jailhouse login:

So that's progress.  Is there a default user name and password to use to
complete the login?  That would point to the problem being booting against
my initramfs files.

Also, the issue where my serial output scrolled continuously was due to the
capture method.  I switched to minicom and no longer see that occur.

Any further thoughts on why jailhouse fails to load the guest when I set
the memory region greater than 200MB?

Thanks,
Wayne



On Tue, Jun 18, 2019 at 9:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:

> On 18.06.19 14:10, Wayne wrote:
> > Jan/Ralf:
> >
> > I just meant that my initramfs files get generated by the "dracut"
> script, which
> > gets run automatically when executing "make install" in the kernel
> > distribution.  I would be happy to try your x86 initrd binary, it may
> tell us
> > something.  I haven't been able to install buildroot successfully.  Is
> there any
>
> Sent.
>
> > specific reason why you would need it for an x86 poweredge as opposed to
> the
> > standard dracut/mkinitramfs for the guest?
>
> The reason is primarily size, a bit convenience: For demo and test
> purposes, you
> want a number of tools and services inside the initramfs that a normal
> does not
> contain (ssh/sshd, various hw diagnostic tools, rt-tests, iperf etc.). Of
> course, you can manually define the rules to copy them in via dracut,
> likely
> quite a bit of work, but then the size would not be 8M. Sure, the latter
> is only
> an issue for smaller embedded targets.
>
> >
> > Running the "jailhouse hardware check" reports "ok" for all categories
> except
> > for the following (which report "optional"):
> >
> > VT-x (VMX) :
> > VMX inside SMX   missing (optional)
> >
> > VT-d (IOMMU #0-3) :
> > 39-bit AGAW  missing (optional)
> >
> > (2M pages and 1G pages show as ok)
>
> Wasn't the reason, ok...
>
> Jan
>
> >
> > Wayne
> >
> > On Tue, Jun 18, 2019 at 2:32 AM Jan Kiszka <jan.kiszka@siemens.com
> > <mailto:jan.kiszka@siemens.com>> wrote:
> >
> >     On 17.06.19 21:06, Wayne wrote:
> >      > Hi Jan,
> >      >
> >      > I am still having trouble getting the non-root linux kernel to
> boot up.
> >     Based
> >      > on your suggestions I tried two scenarios and am using your AMD
> kernel
> >     config
> >      > you pointed me to above:
> >      >
> >      > 1. Attempted to use the 70MB root linux initramfs (generated
> through kernel
> >      > "make install"), but I get this error:
> >
> >     What do you mean with "generated through kernel"?
> >
> >      >
> >      > [    2.648665] rootfs image is not initramfs (write error); looks
> like an
> >     initrd
> >      > [    2.655732] /initrd.image: incomplete write (-28 != 71905893)
> >      > [    2.672708] Freeing initrd memory: 70224K
> >      >
> >      > Since we suspect possible image corruption by the kernel
> extracting,  I
> >     doubled
> >      > my guest linux memory allocation.  Therefore I now have 416MB of
> memory
> >     reserved
> >      > by the root linux command line for the guest.  I can see that the
> "MemTotal"
> >      > available in /proc/meminfo went down by approx 416MB accordingly
> after
> >     updating
> >      > the root command memmap arg.  However, if I try to execute the
> "jailhouse
> >     cell
> >      > linux ..." command with a  memory region .size of 400MB (or even
> 256MB) then
> >      > jailhouse throws the following error:
> >      >
> >      > Traceback (most recent call last):
> >      >    File "./tools/jailhouse-cell-linux", line 824, in <module>
> >      >      cell = JailhouseCell(config)
> >      >    File "/home/test/jailhouse-next/tools/../pyjailhouse/cell.py",
> line
> >     36, in
> >      > __init__
> >      >      raise e
> >      >    File "/home/test/jailhouse-next/tools/../pyjailhouse/cell.py",
> line
> >     33, in
> >      > __init__
> >      >      fcntl.ioctl(self.dev <http://self.dev> <http://self.dev>,
> >      > JailhouseCell.JAILHOUSE_CELL_CREATE, create)
> >      > OSError: [Errno 12] Cannot allocate memory
> >      >
> >      >   Any thoughts here?
> >
> >     Nothing obvious in the configs. Well, you have the 0x3a600000 range
> twice in
> >     the
> >     root cell config. That should not cause the problem, though. Should
> still be
> >     fixed.
> >
> >     Maybe you are running out of hypervisor memory because your hardware
> does not
> >     support large pages and therefore requires larger paging structure.
> But that's
> >     also rather unlikely - unless the hardware is 5 years or so old.
> What all does
> >     "jailhouse hardware check" report?
> >
> >      >
> >      > 2. If I use my 30MB guest linux 4.19 initramfs instead (generated
> through
> >     kernel
> >      > "make install"), then it gets passed the extracting phase but
> falls into the
> >      > dracut emergency shell.  The shell then keeps scrolling
> repeatedly on the
> >     UART
> >      > (ttyS0):
> >      > :/#
> >      > :/#
> >      > :/#
> >      > ...
> >      > Any thoughts on why this scrolling is occuring? I'm viewing the
> serial
> >     output on
> >      > another linux machine with "cat /dev/ttyS0".
> >      >
> >      > Any idea why its dropping into the emergency prompt rather than
> >     continuing to
> >      > boot the kernel?  The initramfs was just re-generated with "make
> install"
> >     and
> >      > should match the 4.19 guest.
> >
> >     Given all the problems and variables, I would rather recommend
> trying a
> >     known-to-work initrd first, ie. the one we generate via buildroot.
> If it helps,
> >     I can share a binary for x86 offlist. From there, you can stepwise
> change more
> >     variables.
> >
> >     Jan
> >
> >      >
> >      > Note that my root kernel is vanilla 4.16 and my non-root linux
> guest is 4.19
> >      > jailhouse enabling from siemens.  I attached my latest System
> config and
> >      > non-linux cell config.
> >      >
> >      >
> >      > Thanks for your repeated help,
> >      >
> >      > Wayne
> >      >
> >      > On Thu, Jun 13, 2019 at 2:55 PM Jan Kiszka <
> jan.kiszka@siemens.com
> >     <mailto:jan.kiszka@siemens.com>
> >      > <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>>
> wrote:
> >      >
> >      >     On 13.06.19 20:49, Wayne wrote:
> >      >      > I added the "-k 10" to the command and unfortunately it
> did not make a
> >      >      > difference with the unpacking.  If I add  "root=/dev/ram0"
> it does get
> >      >     past the
> >      >      > unpacking, but throws the panic for "System is deadlocked
> on memory".
> >      >      >
> >      >      > I have attached my current non-root kernel config.  Should
> I
> >     expect to be
> >      >     able
> >      >      > to log in to the non-root if I use the same initramfs as
> the root
> >     linux?
> >      >      >
> >      >
> >      >     You should at least expect to see no error messages of the
> kernel,
> >     possibly
> >      >     some
> >      >     futile probing of devices and then likely a console prompt.
> >      >
> >      >     Let's try my kernel config from jailhouse-images first. If
> that
> >     works, you can
> >      >     tune from there towards your needs. I still think there is
> some
> >     sizing issue or
> >      >     so, but I'm not seeing the key difference immediately.
> >      >
> >      >     Jan
> >      >
> >      >     --
> >      >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >      >     Corporate Competence Center Embedded Linux
> >      >
> >     --
> >     Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> >     Corporate Competence Center Embedded Linux
> >
>
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2-Cv%3D%3D%2BeJCS8cN-ShK7q%3D%3DQs7UpW-ZfoUcEZ2Tam5c7Q%40mail.gmail.com.
For more options, visit https://groups.google.com/d/optout.

--00000000000081e52c058b9b0b17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jan/Ralf:<div><br></div><div>Ok, with the rootfs.cpio you =
just provided I can see the following on my serial port:</div><div><br></di=
v><div>Welcome to Buildroot</div><div>jailhouse login:</div><div><br></div>=
<div>So that&#39;s progress.=C2=A0 Is there a default user name and passwor=
d to use to complete the login?=C2=A0 That would point to the problem being=
 booting against my initramfs files.</div><div><br></div><div>Also, the iss=
ue where my serial output scrolled continuously was due to the capture meth=
od.=C2=A0 I switched to minicom and no longer see that occur.=C2=A0=C2=A0</=
div><div><br></div><div>Any further thoughts on why jailhouse fails to load=
 the guest when I set the memory region greater than 200MB?</div><div><br><=
/div><div>Thanks,</div><div>Wayne</div><div><br></div><div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue=
, Jun 18, 2019 at 9:08 AM Jan Kiszka &lt;<a href=3D"mailto:jan.kiszka@sieme=
ns.com" target=3D"_blank">jan.kiszka@siemens.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On 18.06.19 14:10, Wayne wr=
ote:<br>
&gt; Jan/Ralf:<br>
&gt; <br>
&gt; I just meant that my initramfs files get generated by the &quot;dracut=
&quot; script, which <br>
&gt; gets run automatically when executing &quot;make install&quot; in the =
kernel <br>
&gt; distribution.=C2=A0 I would be happy to try your x86 initrd binary, it=
 may tell us <br>
&gt; something.=C2=A0 I haven&#39;t been able to install buildroot successf=
ully.=C2=A0 Is there any <br>
<br>
Sent.<br>
<br>
&gt; specific reason why you would need it for an x86 poweredge as opposed =
to the <br>
&gt; standard dracut/mkinitramfs for the guest?<br>
<br>
The reason is primarily size, a bit convenience: For demo and test purposes=
, you <br>
want a number of tools and services inside the initramfs that a normal does=
 not <br>
contain (ssh/sshd, various hw diagnostic tools, rt-tests, iperf etc.). Of <=
br>
course, you can manually define the rules to copy them in via dracut, likel=
y <br>
quite a bit of work, but then the size would not be 8M. Sure, the latter is=
 only <br>
an issue for smaller embedded targets.<br>
<br>
&gt; <br>
&gt; Running the &quot;jailhouse hardware check&quot; reports &quot;ok&quot=
; for all categories except <br>
&gt; for the following (which report &quot;optional&quot;):<br>
&gt; <br>
&gt; VT-x (VMX) :<br>
&gt; VMX inside SMX=C2=A0 =C2=A0missing (optional)<br>
&gt; <br>
&gt; VT-d (IOMMU #0-3) :<br>
&gt; 39-bit AGAW=C2=A0 missing (optional)<br>
&gt; <br>
&gt; (2M pages and 1G pages show as ok)<br>
<br>
Wasn&#39;t the reason, ok...<br>
<br>
Jan<br>
<br>
&gt; <br>
&gt; Wayne<br>
&gt; <br>
&gt; On Tue, Jun 18, 2019 at 2:32 AM Jan Kiszka &lt;<a href=3D"mailto:jan.k=
iszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank"=
>jan.kiszka@siemens.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 17.06.19 21:06, Wayne wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi Jan,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I am still having trouble getting the non-roo=
t linux kernel to boot up. <br>
&gt;=C2=A0 =C2=A0 =C2=A0Based<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; on your suggestions I tried two scenarios and=
 am using your AMD kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0config<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; you pointed me to above:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 1. Attempted to use the 70MB root linux initr=
amfs (generated through kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &quot;make install&quot;), but I get this err=
or:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0What do you mean with &quot;generated through kerne=
l&quot;?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [ =C2=A0 =C2=A02.648665] rootfs image is not =
initramfs (write error); looks like an<br>
&gt;=C2=A0 =C2=A0 =C2=A0initrd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [ =C2=A0 =C2=A02.655732] /initrd.image: incom=
plete write (-28 !=3D 71905893)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; [ =C2=A0 =C2=A02.672708] Freeing initrd memor=
y: 70224K<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Since we suspect possible image corruption by=
 the kernel extracting,=C2=A0 I<br>
&gt;=C2=A0 =C2=A0 =C2=A0doubled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; my guest linux memory allocation.=C2=A0 There=
fore I now have 416MB of memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0reserved<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; by the root linux command line for the guest.=
=C2=A0 I can see that the &quot;MemTotal&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; available in /proc/meminfo went down by appro=
x 416MB accordingly after<br>
&gt;=C2=A0 =C2=A0 =C2=A0updating<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the root command memmap arg.=C2=A0 However, i=
f I try to execute the &quot;jailhouse<br>
&gt;=C2=A0 =C2=A0 =C2=A0cell<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; linux ...&quot; command with a=C2=A0 memory r=
egion .size of 400MB (or even 256MB) then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; jailhouse throws the following error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 File &quot;./tools/jailhouse-cel=
l-linux&quot;, line 824, in &lt;module&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 cell =3D JailhouseCell(co=
nfig)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 File &quot;/home/test/jailhouse-=
next/tools/../pyjailhouse/cell.py&quot;, line<br>
&gt;=C2=A0 =C2=A0 =C2=A036, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; __init__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 raise e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 File &quot;/home/test/jailhouse-=
next/tools/../pyjailhouse/cell.py&quot;, line<br>
&gt;=C2=A0 =C2=A0 =C2=A033, in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; __init__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 fcntl.ioctl(<a href=3D"ht=
tp://self.dev" rel=3D"noreferrer" target=3D"_blank">self.dev</a> &lt;<a hre=
f=3D"http://self.dev" rel=3D"noreferrer" target=3D"_blank">http://self.dev<=
/a>&gt; &lt;<a href=3D"http://self.dev" rel=3D"noreferrer" target=3D"_blank=
">http://self.dev</a>&gt;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; JailhouseCell.JAILHOUSE_CELL_CREATE, create)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; OSError: [Errno 12] Cannot allocate memory<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0Any thoughts here?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Nothing obvious in the configs. Well, you have the =
0x3a600000 range twice in<br>
&gt;=C2=A0 =C2=A0 =C2=A0the<br>
&gt;=C2=A0 =C2=A0 =C2=A0root cell config. That should not cause the problem=
, though. Should still be<br>
&gt;=C2=A0 =C2=A0 =C2=A0fixed.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Maybe you are running out of hypervisor memory beca=
use your hardware does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0support large pages and therefore requires larger p=
aging structure. But that&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0also rather unlikely - unless the hardware is 5 yea=
rs or so old. What all does<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;jailhouse hardware check&quot; report?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; 2. If I use my 30MB guest linux 4.19 initramf=
s instead (generated through<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &quot;make install&quot;), then it gets passe=
d the extracting phase but falls into the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; dracut emergency shell.=C2=A0 The shell then =
keeps scrolling repeatedly on the<br>
&gt;=C2=A0 =C2=A0 =C2=A0UART<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; (ttyS0):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; :/#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; :/#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; :/#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; ...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Any thoughts on why this scrolling is occurin=
g? I&#39;m viewing the serial<br>
&gt;=C2=A0 =C2=A0 =C2=A0output on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; another linux machine with &quot;cat /dev/tty=
S0&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Any idea why its dropping into the emergency =
prompt rather than<br>
&gt;=C2=A0 =C2=A0 =C2=A0continuing to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; boot the kernel?=C2=A0 The initramfs was just=
 re-generated with &quot;make install&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; should match the 4.19 guest.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Given all the problems and variables, I would rathe=
r recommend trying a<br>
&gt;=C2=A0 =C2=A0 =C2=A0known-to-work initrd first, ie. the one we generate=
 via buildroot. If it helps,<br>
&gt;=C2=A0 =C2=A0 =C2=A0I can share a binary for x86 offlist. From there, y=
ou can stepwise change more<br>
&gt;=C2=A0 =C2=A0 =C2=A0variables.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Note that my root kernel is vanilla 4.16 and =
my non-root linux guest is 4.19<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; jailhouse enabling from siemens.=C2=A0 I atta=
ched my latest System config and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; non-linux cell config.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks for your repeated help,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Wayne<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Thu, Jun 13, 2019 at 2:55 PM Jan Kiszka &l=
t;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@si=
emens.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jan.kiszka@siemens.com=
" target=3D"_blank">jan.kiszka@siemens.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:jan.kiszka@sieme=
ns.com" target=3D"_blank">jan.kiszka@siemens.com</a> &lt;mailto:<a href=3D"=
mailto:jan.kiszka@siemens.com" target=3D"_blank">jan.kiszka@siemens.com</a>=
&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0On 13.06.19 20:49, Wayne w=
rote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I added the &quot;-k=
 10&quot; to the command and unfortunately it did not make a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; difference with the =
unpacking.=C2=A0 If I add=C2=A0 &quot;root=3D/dev/ram0&quot; it does get<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0past the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; unpacking, but throw=
s the panic for &quot;System is deadlocked on memory&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; I have attached my c=
urrent non-root kernel config.=C2=A0 Should I<br>
&gt;=C2=A0 =C2=A0 =C2=A0expect to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0able<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt; to log in to the non=
-root if I use the same initramfs as the root<br>
&gt;=C2=A0 =C2=A0 =C2=A0linux?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0You should at least expect=
 to see no error messages of the kernel,<br>
&gt;=C2=A0 =C2=A0 =C2=A0possibly<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0some<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0futile probing of devices =
and then likely a console prompt.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Let&#39;s try my kernel co=
nfig from jailhouse-images first. If that<br>
&gt;=C2=A0 =C2=A0 =C2=A0works, you can<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0tune from there towards yo=
ur needs. I still think there is some<br>
&gt;=C2=A0 =C2=A0 =C2=A0sizing issue or<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0so, but I&#39;m not seeing=
 the key difference immediately.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Jan<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Siemens AG, Corporate Tech=
nology, CT RDA IOT SES-DE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Corporate Competence Cente=
r Embedded Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Siemens AG, Corporate Technology, CT RDA IOT SES-DE=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Corporate Competence Center Embedded Linux<br>
&gt; <br>
<br>
-- <br>
Siemens AG, Corporate Technology, CT RDA IOT SES-DE<br>
Corporate Competence Center Embedded Linux<br>
</blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CA%2B%2BKhc2-Cv%3D%3D%2BeJCS8cN-ShK7q%3D%3DQs7UpW-=
ZfoUcEZ2Tam5c7Q%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/CA%2B%2BKhc2-Cv%3D%3D%2BeJCS8=
cN-ShK7q%3D%3DQs7UpW-ZfoUcEZ2Tam5c7Q%40mail.gmail.com</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--00000000000081e52c058b9b0b17--
