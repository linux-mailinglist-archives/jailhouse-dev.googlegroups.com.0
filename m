Return-Path: <jailhouse-dev+bncBCR7PPMN34DRB2P27TVAKGQEVIJGJBQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 906769A4D2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 23 Aug 2019 03:12:10 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id g6sf4070293otq.13
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Aug 2019 18:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ljGFJBvQXYOvBmlPtOXED34sIn163c8X/3pBmZqQ2ds=;
        b=AW6wZ4OIr7DrNE/4ywMGChoRHjKQbeI2k54AOgTQYTOWEU+gKiavnJn25epx/RqEYU
         X0KiHEZ6hbwpt7orD4Qu0kiT+NQuOYAHMAzIlvZMAIEOaDRrok3O9nW93+qntzLZduXp
         TBtCYQ7pInSyNm6FkIx4H3e6nb1z1n5i8kIiUCdeWtQ2ghGDveMF8s4H1vuC3XP06X2s
         bnMwpaVt1EGHACzwre5U8y4LZYC5+3H1WBhL8/CzCY4lLlAqjQPbHx8nUH49CmXHnvMi
         +kjqV0Ff4CTOjtgI5/4/Q961iA/qz8AAGz3gHPx1OwhrN1mBA7KVqt8ymKnXIMw2XCv+
         pWnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ljGFJBvQXYOvBmlPtOXED34sIn163c8X/3pBmZqQ2ds=;
        b=hJn239k30w8v3Xe1OuvhKxUJ6uOYVJsSCq2QPFX4qXG9MZJklu5+3G/ZzSeFszXuoO
         zRsXGSQBODg1CYNUA+9x7O6ZE2LBUi48n5s9dKmgslAEIRcgp8iEXGuS/HSSdnIuUGgx
         tV1oNxmTmbhJ4OPCyGiVb4mrv4/KZL+pONEc5DBYoif1YazGGHaUfsaicAybaV/tu9rF
         DF6OX1L/YGvip5MIwe+9mhywmnSq4orwOGNQVTFtyY6WpULloagAkVQ9OP9M2dp7oi7r
         J/4fqj5pAOMz7wf0gr8Lti0OOGcj103KIs3gtt5fJkcgm89PAAwfUNPt3wzd3lYu/UCp
         0SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ljGFJBvQXYOvBmlPtOXED34sIn163c8X/3pBmZqQ2ds=;
        b=q+weo96KO2gF4FUXJmZqSLwFiB+ZUyuMC2K2WwFAT8dy4TnqqbD6rh+gIsK+Ha6H0S
         9wDWGMDkTG2GaZWR2ZS3tJgh2ZKViS9JdbU9+piNG+UPQHWO9UF2K9GK0p8izXpkEkPG
         SzNt7fvoMqdLS8AbNANornU3RVKE2NnG/WfeuZtqDi7zaNn9v2KgxJZnE1j75qZiaxe8
         7z+As30oPX0nFFB5UYVwx6V3a56RM0kUHEaY/Qg69ye7aCuFayYxP3xCIM1kczuCTCt+
         uL9+Wi3uZre/2XBKXjEMT1aamcwjuekKl/wYcTE3XRPDYkGjhlfv55SjYzdD+V43r4Br
         +FqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFFER22kILKF4wkD9Wn9vJvpMpn+AkpaXP6rfBNVJHRVmcCQyB
	5x2IJNh0XrelLlgEaTenXak=
X-Google-Smtp-Source: APXvYqyu4KD8byMLiAzxbn8d4J4rLUfxfEzWy3WRnYrwnjS/P7rHWppud6u6LWbp2gqtJaytME5azg==
X-Received: by 2002:a05:6830:1209:: with SMTP id r9mr2211264otp.128.1566522729228;
        Thu, 22 Aug 2019 18:12:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:36c:: with SMTP id 99ls872084otv.3.gmail; Thu, 22 Aug
 2019 18:12:08 -0700 (PDT)
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr1963013oth.150.1566522728678;
        Thu, 22 Aug 2019 18:12:08 -0700 (PDT)
Date: Thu, 22 Aug 2019 18:12:08 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <325fe360-0bf4-4687-b2a2-309e9f9acd46@googlegroups.com>
Subject: Ivshmem-net driver for Linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_465_1449545802.1566522728089"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_465_1449545802.1566522728089
Content-Type: multipart/alternative; 
	boundary="----=_Part_466_1116845806.1566522728089"

------=_Part_466_1116845806.1566522728089
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I came across Jailhouse's version of Linux (
https://github.com/siemens/linux/tree/jailhouse-enabling/4.19) which has 
ivshmem-net driver on it. I tried to use the 4.14 version of the fork as 
Linux external source in Petalinux 2018.2 (due to compability), but i 
couldn't boot the system with that external kernel source. So, i am asking 
if someone has the patch for me to apply on Petalinux's default kernel 
source (4.14.0), or if you could tell me what files do i need to change in 
order for ivshmem-net functionality be available for me.

Thank you.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/325fe360-0bf4-4687-b2a2-309e9f9acd46%40googlegroups.com.

------=_Part_466_1116845806.1566522728089
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-size: small;">Hello everyone,</sp=
an></div><span style=3D"font-size: small;"><div><span style=3D"font-size: s=
mall;"><br></span></div>I came across Jailhouse&#39;s version of Linux (</s=
pan><a href=3D"https://github.com/siemens/linux/tree/jailhouse-enabling/4.1=
9" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=
=3Dhttps://github.com/siemens/linux/tree/jailhouse-enabling/4.19&amp;source=
=3Dgmail&amp;ust=3D1566606539085000&amp;usg=3DAFQjCNF74qguhStEnYTd4WJAC888z=
ERq4w" style=3D"color: rgb(17, 85, 204); font-size: small;">https://github.=
com/siemens/<wbr>linux/tree/jailhouse-enabling/<wbr>4.19</a><span style=3D"=
font-size: small;">) which has ivshmem-net driver on it. I tried to use the=
 4.14 version of the fork as Linux external source in Petalinux 2018.2 (due=
 to compability), but i couldn&#39;t boot the system with that external ker=
nel source. So, i am asking if someone has the patch for me to apply on Pet=
alinux&#39;s default kernel source (4.14.0), or if you could tell me what f=
iles do i need to change in order for ivshmem-net functionality be availabl=
e for me.</span><br><div><span style=3D"font-size: small;"><br></span></div=
><div><span style=3D"font-size: small;">Thank you.</span></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/325fe360-0bf4-4687-b2a2-309e9f9acd46%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/325fe360-0bf4-4687-b2a2-309e9f9acd46%40googlegroups.com<=
/a>.<br />

------=_Part_466_1116845806.1566522728089--

------=_Part_465_1449545802.1566522728089--
