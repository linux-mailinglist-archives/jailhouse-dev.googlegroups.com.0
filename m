Return-Path: <jailhouse-dev+bncBC653PXTYYERBYNC2GHAMGQEEIOODVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DA74842D2
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jan 2022 14:53:38 +0100 (CET)
Received: by mail-qk1-x740.google.com with SMTP id bj32-20020a05620a192000b0046dcca212b6sf20867756qkb.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Jan 2022 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=1+9ge+kVnIoS4JjvhIlmOYL/zeaafFtXIUbJdOycMrM=;
        b=M0WlVd2KegjwxoPK2fQbbKO9MPHOSPeEcKfk2DeR6qIuLrQEKyZyBV3oxgRLGVP6tA
         x3vN9iNEXnEj6D/v9oQhoa3Bhsxh062cgbwAGbknlxOUldymsRGeyeQVaq9UOUoswMwd
         TnLrVkXo5B5JNaYmIi8enGuWofXxhHOhhgwoh5CJ+iUxQJ4Zfb/TBquJszui7gEOz+0J
         3T7Kn9Bi34ml4TtUn4kEyKdkCu8oESGeHNEyorP0oYl/wy+ZWTboN0pCuSrMN+iYUaIH
         cOHYBVBEn9s+kM00NgIsr2xfEC86ORv6vPE643rs97PDx1i+TDfBog1WfF5TjO9IrRsR
         9ELw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1+9ge+kVnIoS4JjvhIlmOYL/zeaafFtXIUbJdOycMrM=;
        b=XUvYQhENfapqQlK0yWSmQVp66aPBl76I5Y+/suqb+eH1fgUw/xKT6svWOZpwhNXk3n
         TNCcImAyWNnhabSUgmm5o+VJAUD5bCeMp8dMByuJnQwmJE6DBIgr4OLPDD1IH3Ox+JHh
         5IyMRHSmJO1/yU/tpYXRUPfOzpPn1Sax00gziJh2FOgKhG5P+4xhKEAJCCz/tO8xtZRf
         X5Ycv5Qrr+Pfy2EIGIPG02TGB8IbmNDjh4xgaA2PX+AqgAn8rRTI1E2KpJDHOrhd/f+C
         LSOUoB5riZPK3hRpZGvq+AXXgamMKCQrGZ+vp8sLmbcoikM5bvhYuJfvJYJN9fwfnidj
         t0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1+9ge+kVnIoS4JjvhIlmOYL/zeaafFtXIUbJdOycMrM=;
        b=6A/CzUxisddlKRoDUYmNK7qExCX6BGDTVFJxEAqEXEfe2yDrkBTTZHLp1rLGyR9W+/
         IsaApMB5/HQ0b62sqQJRqIbObFfKT93nY4nRRJ55Tpzs/7w7V6Uq8IxdpK3rwfgANvHp
         Wp2VUTSjy03sLGTp4JbeSGbvko+69kcmP312BF5jpNFlKhN1b9hFMMhVCWvl94BaQzc6
         iwj5gEeFlzaWkv2JleSrMTDteHXs3tJix2B+LHFI4XGweligvAUAXkuTyzAyjxx1R1WY
         utIngBKxEtJdDgq38JPfJ5LEz9mjxGEN5c9mJ8I71J0UJbWiYch7XT5vFrSY6HdspTgw
         SabA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533JhL3U1DDFtMT7MqRYInSt+PPDzwc5X3U46Xl76fXjMahZaTek
	eoCgmrahG2YqyXD75SrBI3Y=
X-Google-Smtp-Source: ABdhPJxT9lxwW8Ql2nGLppRSNHJwddcGxcfvvzdW8Qxdq1lqcfsiC6OhM0WheYim3qd2j38WMWClkA==
X-Received: by 2002:a05:620a:4507:: with SMTP id t7mr35963546qkp.660.1641304417337;
        Tue, 04 Jan 2022 05:53:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5bc7:: with SMTP id b7ls18177561qtb.11.gmail; Tue, 04
 Jan 2022 05:53:36 -0800 (PST)
X-Received: by 2002:ac8:5bcf:: with SMTP id b15mr43788862qtb.474.1641304416574;
        Tue, 04 Jan 2022 05:53:36 -0800 (PST)
Date: Tue, 4 Jan 2022 05:53:36 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1564aad3-da0a-49dc-9966-525688ee83f5n@googlegroups.com>
Subject: Building Non-Root-Linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_12341_916655809.1641304416049"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_12341_916655809.1641304416049
Content-Type: multipart/alternative; 
	boundary="----=_Part_12342_993743833.1641304416049"

------=_Part_12342_993743833.1641304416049
Content-Type: text/plain; charset="UTF-8"

Hello everyone, I am still using RPi4, I have 1GB allocated memory for 
Jailhouse and now I need to build a custom Linux for the non-root cell. I 
started with the easiest method using buildroot, but I got an error while 
loading the 153Mb image: 
No space found to load all images
I reserved 1GB using device tree @0x2000 0000
Is there an attribute in rpi4-linux-demo.c that specifies space?
What I understand, that the user can either give a full image that includes 
also the rootfs.cpio, or and image and a rootfs.cpio
Is is possible to use Yocto for building a small linux for the non-root 
cell?
From where can I start to use ISAR-build, to build a Linux for the non-root 
cell?

Kind regards, 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1564aad3-da0a-49dc-9966-525688ee83f5n%40googlegroups.com.

------=_Part_12342_993743833.1641304416049
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello everyone, I am still using RPi4, I have 1GB allocated memory for Jail=
house and now I need to build a custom Linux for the non-root cell. I start=
ed with the easiest method using buildroot, but I got an error while loadin=
g the 153Mb image:&nbsp;<br>No space found to load all images<br>I reserved=
 1GB using device tree @0x2000 0000<br>Is there an attribute in rpi4-linux-=
demo.c that specifies space?<br>What I understand, that the user can either=
 give a full image that includes also the rootfs.cpio, or and image and a r=
ootfs.cpio<br>Is is possible to use Yocto for building a small linux for th=
e non-root cell?<br>From where can I start to use ISAR-build, to build a Li=
nux for the non-root cell?<div><br>Kind regards,&nbsp;<br>Moustafa Noufale<=
/div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1564aad3-da0a-49dc-9966-525688ee83f5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1564aad3-da0a-49dc-9966-525688ee83f5n%40googlegroups.co=
m</a>.<br />

------=_Part_12342_993743833.1641304416049--

------=_Part_12341_916655809.1641304416049--
