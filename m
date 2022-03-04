Return-Path: <jailhouse-dev+bncBCA6TFW6UQBRBVU6Q6IQMGQEMPAYS4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id E20564CCFFF
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Mar 2022 09:35:35 +0100 (CET)
Received: by mail-qt1-x837.google.com with SMTP id r16-20020ac87950000000b002de06985208sf5562787qtt.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Mar 2022 00:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QclSD2uPOA4oCRc9tvkB2YGxwUAZpVEO9vZ6LhuR2Vs=;
        b=VR15KG3Nu0hVvqJifPbbF+pu9wW7T4wsaQoJJe/QhAkbY7XqAHUsKvpZp8Z25DgP1y
         zQzJabFy6oJm3LNTexBQYoiEASOhQZNLefl92GvM7s1qbYyiccYi2irdZol6SFFgRWTQ
         kveibqz5hwT20UxmmQOkNfjixt1Vmepe4jg3pl70B0wH/quPnZN0emDpxGtcqhfKNQsa
         3EXYOLdumB5RhVDz6ez6jA9C0qHNWtEIjT2O7RPJhAJc2s9iuvW6KdXbr0DTFu0nBSMr
         g4tzWlO9taFmVvpsiyX66Hz+Q1BYPrVXfZngln14vf+4XrRI/uyPhi2FjfQLdiyJi0XG
         fH2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QclSD2uPOA4oCRc9tvkB2YGxwUAZpVEO9vZ6LhuR2Vs=;
        b=cpTFc7OgjpHvXSaUGyts6aP9tD/gFLdcj8VcXcvCm8gzmYGEpOA38PiJ1uQ91wl/wn
         4gLG6heVXEezLSS9/pQC/KApYFF+eLxF6oWNUqWFB3ezlUOOqMgspEMuRlfEb2mFG+bg
         rm1ePEyIi/PPhJL2JQzj07FZE+zxqyl1aSkHerEAQqnrkcZtDNnUXYNeuZ1xHKUld0Kk
         8DO2Zi/2uTrAQgle/Z5Yr3rnc4vfSWXN/alX7HZeNBFs/QwGqZd10trJaZdmRO3YkWCC
         r1mAU2/IkoKVj9Vz4Eep3ACBu56ftytqEsinYsVV9F9eolPrclzdFbkmkZLZN8sjJIqd
         Qijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QclSD2uPOA4oCRc9tvkB2YGxwUAZpVEO9vZ6LhuR2Vs=;
        b=bJimnzLmGLxyJupM+KXmIML4Q1XXm49zXxOlhp/7qPN7WdTEJ/FHZkA+SuKy0kxK/A
         5HgZixZ/01VpLnoYF9hD0CKBONbA4j3rsUUhag9CBqW3xEJBhjeKq2fwrXHJnvowCXlk
         +7KFHK/ot6ZCqJPL0N4qGZqjTAEbW9OlXhFsvYtzzCOGRJSy73dWQoMUE56vj6PKKjGT
         /1l1OmLmWhdAg9c23MsMbI4teH1UV4om9SS8IVmSw0KTTEs68eGfS0ckDa5cUkw5WxS7
         4D5DEJIx1PLeI/LjYrTWFqib9pdf5jfN2EGN6b82/eBxliq4k1B15CJjgDsIFkKzlJrD
         qayw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GTAuqmEGXQ7NkZpEtIcDDr556xboelsmvdmyQQtXVTc3z8+RE
	q/Y733ULkKLF3zEFUfbYZB4=
X-Google-Smtp-Source: ABdhPJzwSrwpWf2Xf6HrQd1rEQHEJxIzXZp3Mks+uE4IH7ciPtAYIo0s2eHzICIGuN87KxQSrfTqgg==
X-Received: by 2002:ac8:59d2:0:b0:2de:8904:e25 with SMTP id f18-20020ac859d2000000b002de89040e25mr30844789qtf.52.1646382934856;
        Fri, 04 Mar 2022 00:35:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:a9ca:0:b0:4b5:a976:975d with SMTP id s193-20020a37a9ca000000b004b5a976975dls2352776qke.3.gmail;
 Fri, 04 Mar 2022 00:35:34 -0800 (PST)
X-Received: by 2002:a05:620a:1506:b0:47c:fd66:7053 with SMTP id i6-20020a05620a150600b0047cfd667053mr1867511qkk.322.1646382933956;
        Fri, 04 Mar 2022 00:35:33 -0800 (PST)
Date: Fri, 4 Mar 2022 00:35:33 -0800 (PST)
From: Giovanni Olino <gianni.olino@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <77226583-76dd-4c0b-9a0c-c69332e824b9n@googlegroups.com>
Subject: [Banana Pi] make modules_install give "Makefile:1250: recipe for
 target '_modinst_'  failed"
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5146_240784242.1646382933392"
X-Original-Sender: gianni.olino@gmail.com
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

------=_Part_5146_240784242.1646382933392
Content-Type: multipart/alternative; 
	boundary="----=_Part_5147_1528374183.1646382933392"

------=_Part_5147_1528374183.1646382933392
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm trying to get Jailhouse on  a Banana Pi M1.
Siemens has a docomentation for it 
(https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-banana-pi-arm-board.md) 
but I'm using linux_4.19, in particular git clone -b 
jailhouse-enabling/4.19 https://github.com/siemens/linux.git 
linux_siemens_4.19.
On the compile machine every seems to work properly, I can do Make of 
Linux, Jailhouse and FreeRTOS without problems or errors but one moved on 
the Board errors occours.

On the Bananian, trough sshfs, when I try to mount the compiled kernel with 
"make mudules_install" this errors come out:

 * INSTALL block/bfq.ko*
*scripts/sign-file: 2: scripts/sign-file: Syntax error: word unexpected 
(expected "(" )*

*scripts/Makefile.modinst:36: recipe for target 'block/bfq.ko' failed*
*make[1]: *** [block/bfq.ko] Error 2*
*Makefile:1250: recipe for targer '_modinst_' failed*
*make ***[_modinst_] Error 2*

In the sign-file script I don't see where a parenthesis might be missing 
and  for target block/bfq.ko don't know what to look for.


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/77226583-76dd-4c0b-9a0c-c69332e824b9n%40googlegroups.com.

------=_Part_5147_1528374183.1646382933392
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div><div>I'm trying to get Jailhouse on&nbsp; a Banana Pi M1.</di=
v><div>Siemens has a docomentation for it (https://github.com/siemens/jailh=
ouse/blob/master/Documentation/setup-on-banana-pi-arm-board.md) but I'm usi=
ng linux_4.19, in particular <span><span>git clone -b jailhouse-enabling/4.=
19 https://github.com/siemens/linux.git linux_siemens_4.19.</span></span></=
div><div><span><span>On the compile machine every seems to work properly, I=
 can do Make of Linux, Jailhouse and FreeRTOS without problems or errors bu=
t one moved on the Board errors occours.</span></span></div><div><span><spa=
n><br></span></span></div><div><span><span>On the Bananian, trough sshfs, w=
hen I try to mount the compiled kernel with "make mudules_install" this err=
ors come out:</span></span></div><div><span><span><br></span></span></div><=
div><span><span>&nbsp;<i> INSTALL block/bfq.ko</i></span></span></div><div>=
<i><span><span>scripts/sign-file: 2: scripts/sign-file: Syntax error: word =
unexpected (expected "(" )</span></span></i></div><div><i><span><span>scrip=
ts/Makefile.modinst:36: recipe for target 'block/bfq.ko' failed<br></span><=
/span></i></div><div><i><span><span>make[1]: *** [block/bfq.ko] Error 2</sp=
an></span></i></div><div><i><span><span>Makefile:1250: recipe for targer '_=
modinst_' failed</span></span></i></div><div><span><span><i>make ***[_modin=
st_] Error 2</i><br></span></span></div><div><span><span><br></span></span>=
</div><div><span><span><span dir=3D"ltr"><span>In the sign-file script I do=
n't see where a parenthesis might be missing and&nbsp; for target block/bfq=
.ko don't know what to look for.<br></span></span></span></span></div><div>=
<span><span><span dir=3D"ltr"><span><br></span></span></span></span></div><=
div><span><span><span dir=3D"ltr"><span><br></span></span></span></span></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/77226583-76dd-4c0b-9a0c-c69332e824b9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/77226583-76dd-4c0b-9a0c-c69332e824b9n%40googlegroups.co=
m</a>.<br />

------=_Part_5147_1528374183.1646382933392--

------=_Part_5146_240784242.1646382933392--
