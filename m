Return-Path: <jailhouse-dev+bncBC653PXTYYERBI5MRWGQMGQEZQ3MM3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D146059C
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Nov 2021 11:12:52 +0100 (CET)
Received: by mail-qt1-x83c.google.com with SMTP id g2-20020ac87d02000000b002b277218d03sf14565781qtb.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Nov 2021 02:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uGnA+RgWwgPSln4r9nsM3xBkpwB1I81aP1052VRC8Gw=;
        b=F17iKhg3ON62z9woWTavQSu2AlrngezlmgBWy6j8JDkmVrNGGDrs+aH1/hOg4vXg6e
         E7Wbcj0UzrsaBshSs1f9WL+XExtfhcsHpNN23pNN3Mj80IQQxMMSvuYC8lhXjl3umr4B
         ckB0JzVeaset6BqZ+Slg/EvqGxZj6B/9AaM/P2X3znd5yqZ/7wz4r/6S6GJQ8gMNyd/K
         HXV2RXAF4CfZGLhKaz+mFbBMsSFmpHRBHdw7r3JZEzgpe4XMJuuCFJCwR49sQxs+6W6F
         UxfARl11sp49gsebUJgpZ6aEka4pz3nhTeNY2nayzVfv8f+shTJjXQOpD+2uWIT40PxF
         8QzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uGnA+RgWwgPSln4r9nsM3xBkpwB1I81aP1052VRC8Gw=;
        b=TXn29eyx1lGHKLSlbwIjGqj3BAtkohEJAb/VfOSO3TuGherGoqoiG31Xpw57Z25Gnh
         9vkZRqt4Ll9aOffyP466bwn+hXqvKV8ctSxhJcLAEPD5qwUV8fJygqioG3eeuX2xvlN9
         u2u7wJt9estUJlLQVeGQUJ+MmRTaUR/EcKtl4fsi4o7fj7Q/QqNUFRbL8HzOijciExQo
         /NNfjKo4c3SuPGHvtdmmWBpwBZXsyW1YNGJx6KQStlcTLC2cncgURVf4IOVn+OWrY+jC
         e01h770zcEj3hbmHKYVz/PAUG+AN1m08l2ryuUXbqVMoSO9cPgKLI9AAynlcp8Qe+vQE
         tToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uGnA+RgWwgPSln4r9nsM3xBkpwB1I81aP1052VRC8Gw=;
        b=xITHcfAjp7PVN5igEdxA8CvzySuVp1pbao7tHHVV8fmcqAQq3200X2HNa9bkWmcgN2
         dihe49aENoosccTYuEiY5zhjRGiCj2Iuo+9lG8XY1XvZaKq8yMTV7CLIboClgV8M6K5X
         +LIwmV1CVtaFk0Hbx6PKVUqQzefHScI1Kn0e9RqDUVm2DS2z04pXdstCqKT4qNcFV85W
         fo9GkFGKvcEoEWxtkqs1AziBHCvUcM1zoUpBthSp4enGwm+MlC/tDkPLV5ZqWE3YQaQO
         eWPepsG2HdXvzwLokXyZG5GQCBR7rx2zCum8Uh588bWV0xZYW2PBtvxtYgSE4WGNYhjj
         aCsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hRmYeu7OxKrxh1o91Hyc16LiEWFeVQgUKUUNzMu9mYrxcGTJx
	f9n+r8I30o3JXbEZ1zoW144=
X-Google-Smtp-Source: ABdhPJyVtw2CWsxLAib4RDWkzYIe7mCoxdIJcvz7Q1v7hBKi7PpvHnaqgZuSIE7Th2WzaannQg4XKQ==
X-Received: by 2002:a05:6214:da9:: with SMTP id h9mr36412999qvh.2.1638094371281;
        Sun, 28 Nov 2021 02:12:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:9d41:: with SMTP id n1ls2042937qvf.8.gmail; Sun, 28 Nov
 2021 02:12:50 -0800 (PST)
X-Received: by 2002:a05:6214:c42:: with SMTP id r2mr23001262qvj.70.1638094370545;
        Sun, 28 Nov 2021 02:12:50 -0800 (PST)
Date: Sun, 28 Nov 2021 02:12:49 -0800 (PST)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <25af4d11-dc16-42be-9e8c-9dd5dc3b445bn@googlegroups.com>
In-Reply-To: <171e1797-c04c-a816-9235-73891de7a422@siemens.com>
References: <28e452f0-6d96-4db5-9c39-be0c148d12b9n@googlegroups.com>
 <20211025161715.61aa35fe@md1za8fc.ad001.siemens.net>
 <251534da-afb0-4c8d-b44f-28fcba5999acn@googlegroups.com>
 <20211102095459.3a17440d@md1za8fc.ad001.siemens.net>
 <8dce9427-624f-4d62-b803-3ef00552e283n@googlegroups.com>
 <4619cf79-cc46-41f1-914c-9c1f119482dfn@googlegroups.com>
 <72ba65bd-dfaf-40b4-87a8-785657132f60n@googlegroups.com>
 <238dd0b3-af24-4b8a-905e-579fdebe8b0an@googlegroups.com>
 <a18b655e-fd9d-32b9-6e10-acf1fdf91661@siemens.com>
 <9072dd41-feb1-486d-86be-7160e23240edn@googlegroups.com>
 <595778e6-5066-2fc7-ce1d-15bb30b24cde@siemens.com>
 <69d8e666-daf5-4146-b96e-8a6578ec2cf6n@googlegroups.com>
 <597c86a9-bba0-43af-bc14-629d483c0bden@googlegroups.com>
 <e1ae4c0a-f3c4-5dd2-fd13-cffa2bd9b3a5@siemens.com>
 <c092ca0e-76b0-4004-a5b1-9e205a5fbee0n@googlegroups.com>
 <83e82fe2-6a32-339c-01bf-46a7a51d8e22@siemens.com>
 <ccf64b1a-986c-4f02-8103-5a04f99a8a5fn@googlegroups.com>
 <171e1797-c04c-a816-9235-73891de7a422@siemens.com>
Subject: Re: Jailhouse cell linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4620_733283786.1638094369976"
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

------=_Part_4620_733283786.1638094369976
Content-Type: multipart/alternative; 
	boundary="----=_Part_4621_1725503513.1638094369976"

------=_Part_4621_1725503513.1638094369976
Content-Type: text/plain; charset="UTF-8"

Yes, I understand and the image works fine, but my studies is focusing on 
the kernel requirements of jailhouse. 
At this stage, Jailhouse is working on both kernels: 5.10, and 5.4, but the 
pci is missing the kernel drivers, messages such as:

ivshmem-net 0001:00:01.0: enabling device (0000->-0002) and all other 
ivshmem-net messages(4) are not displayed when I enable jailhouse, as well 
as no kernel driver for the added virtual devices is present when lspci -k. 
So, what  could be missing here?

Thanks in advance, 
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/25af4d11-dc16-42be-9e8c-9dd5dc3b445bn%40googlegroups.com.

------=_Part_4621_1725503513.1638094369976
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I understand and the image works fine, but my studies is focusing on t=
he kernel requirements of jailhouse. <br><div>At this stage, Jailhouse is w=
orking on both kernels: 5.10, and 5.4, but the pci is missing the kernel dr=
ivers, messages such as:</div><div><br></div><div>ivshmem-net 0001:00:01.0:=
 enabling device (0000-&gt;-0002) and all other ivshmem-net messages(4) are=
 not displayed when I enable jailhouse, as well as no kernel driver for the=
 added virtual devices is present when lspci -k. So, what&nbsp; could be mi=
ssing here?</div><div><br></div><div>Thanks in advance, <br>Moustafa Noufal=
e<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/25af4d11-dc16-42be-9e8c-9dd5dc3b445bn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/25af4d11-dc16-42be-9e8c-9dd5dc3b445bn%40googlegroups.co=
m</a>.<br />

------=_Part_4621_1725503513.1638094369976--

------=_Part_4620_733283786.1638094369976--
