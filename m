Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBSMH76NQMGQEF3A2KWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id E69FB637F9B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Nov 2022 20:19:38 +0100 (CET)
Received: by mail-qt1-x839.google.com with SMTP id hg24-20020a05622a611800b003a66175d924sf2368578qtb.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Nov 2022 11:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3E4zv4XZbMTknWSq+oKbMg3J+5hInaPRsc8XQASwofo=;
        b=C4X20E6GdAn5WkFA9sEc/ikOG0t+4vpnLpoQT9HslmZZl/X4FGPALEmOJVdp9wbtPT
         Wuf3JgvwzpZT1WjQAn48E5AQNYrOwWjMSQS3G9tBp4A11SVA795FB5X0k+8yZjeDJfuy
         Vty7EOIgm4jHG2zZHvD3InUn18bjdxez+iv40PpWj6ql2y3sgfSex7sAoqvSJHXMe0W+
         S1goqIh/Q7DYAWYlHjJkjDLrqQIS4Xw4Niz3RkESOWYuSpH7nIExZsPvkrcY3Imm+mJV
         RwsoeDXkReWOLWloGyyQ6EsnQtZ4InVzLhGfokKyDZyaBUny90oZsqp9ozpBZlRlJkGG
         nCHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E4zv4XZbMTknWSq+oKbMg3J+5hInaPRsc8XQASwofo=;
        b=CO2T4FfnIXb16eE14kOdXOUosovuz+jmBaSoRGVPDug8HqtCCPCfsH1NfgZiSDwaVz
         1JzFcf/6JdCLkhyP3IoWOdjVy5P5rfXbD/CZWS6Jo0tKDiQoo6RbgPA0MEAooIsz41mQ
         hmK/bdMyKMeFnLQvpNJrFhGqjWc6s30uDDQ3MTjdLPN3v465vFIUuTeltGy0DCfA37Ut
         TWGyDc9apTHLYxXgNXFsQ9e+fuW2lk2ALuTl+r7hhWaIYeZXU0U11Bx7ackcY6ZyGgd6
         oene19adCm3H+iFLhI9EoohZXk1iOOply9TO+IWDClt0dgAvOus4vRc1TPnC6k42et5R
         Iqyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E4zv4XZbMTknWSq+oKbMg3J+5hInaPRsc8XQASwofo=;
        b=JAq95koIaKyX2By5R9zOVy3xGLaNmKeAw6cIP73Jm4SWfJet4GFSMpKShdjI3lxCqx
         OLVQnRcrlYvIG3Bsbnz9Ujo/Pm5QleLNzDpFj9h1NRRBBoztXg2OWMvV0ok7gwr2m1Lv
         MhHlx2rMDC/KaITrAFlfEEGSQwWMeVVbkTKKigKw+Noa2ER368YZwoIU+nC3EK9zCNvN
         KdCYqrJo+IG6NHenmJp+6ghPxZ2L4Rmsy0x51fChO0URSE7NlToKnyOKb5o4RpDOTfMd
         lK5IDynR7zE2V6iipnAl1lOvcPZi90KrLvqoAahcS09Mt/KDTa42Si6Ufp4IFvUvxum4
         j6zA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pl/psnpQvchniTCAmx/XKqeQRb9KhGG2W3m/VfXYGrpYfUYUBzQ
	WgVrHkQDORsN67bIMS8D2RA=
X-Google-Smtp-Source: AA0mqf7NzRyJlZnjpENCsKF4QYbsn2VFf3TW+usj3JFUlvIbk4O3saIUTW9iK+nYS1WUffGDmYST6Q==
X-Received: by 2002:a05:622a:8cb:b0:3a4:fdc8:ba9a with SMTP id i11-20020a05622a08cb00b003a4fdc8ba9amr15182810qte.377.1669317577754;
        Thu, 24 Nov 2022 11:19:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1644:b0:6ee:d08f:aa7 with SMTP id
 c4-20020a05620a164400b006eed08f0aa7ls1637397qko.0.-pod-prod-gmail; Thu, 24
 Nov 2022 11:19:37 -0800 (PST)
X-Received: by 2002:a37:aad6:0:b0:6fa:e0bb:cb6d with SMTP id t205-20020a37aad6000000b006fae0bbcb6dmr31384752qke.707.1669317576799;
        Thu, 24 Nov 2022 11:19:36 -0800 (PST)
Date: Thu, 24 Nov 2022 11:19:35 -0800 (PST)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <06ab8036-e7b6-458b-990e-2f685b5fc857n@googlegroups.com>
In-Reply-To: <436612cf-fed1-4b6b-97a4-29683433c8e3n@googlegroups.com>
References: <436612cf-fed1-4b6b-97a4-29683433c8e3n@googlegroups.com>
Subject: Re: the use of 2nd stage MMU translation
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_5336_815689083.1669317575926"
X-Original-Sender: ykonyukh@gmail.com
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

------=_Part_5336_815689083.1669317575926
Content-Type: multipart/alternative; 
	boundary="----=_Part_5337_163645818.1669317575926"

------=_Part_5337_163645818.1669317575926
Content-Type: text/plain; charset="UTF-8"

Hi All,

Answering my own question :) :

I have run the demo from https://github.com/siemens/jailhouse-images for 
Raspberry Pie and simply collected the output of "cat /proc/iomem" before 
running Jailhouse, then after enabling Jailhouse in the root cell and in a 
Linux non-root cell. From that output it looks like Jialhouse does 1:1 
mapping between IPAs and PAs.

On a platform with Zynq UltraScale+ MPSoC, onto which Jailhouse has been 
ported, I have experimented with memory accesses, trying to access from the 
root cell the memory allocated to a non-root Linux cell and the other way 
round - trying to access from the non-root Linux cell the memory allocated 
to the root cell only. As expected, in both cases I have got "Unhandled 
data write...FATAL: unhandled trap (exception class 0x24)", while the cells 
can happily read from/write into physical addresses belonging to their own 
memory regions specified in the respective cells configuration. This 
appears to confirm the use of the 2nd stage translations for restricting 
cells access to physical memory.    

Best Regards,

Yelena


On Monday, November 14, 2022 at 2:19:55 PM UTC Yelena Konyukh wrote:

> Hi All,
>
> I would be very grateful, if anyone could explain how Jailhouse on ARM64 
> architectures uses the 2nd stage MMU translation.
>
> It does look like Jailhouse uses the 2nd stage MMU translations  - for 
> example, t is easy to find in the code where such registers as VTCR_EL2 
> and VTTBR_EL2 are set. I am guessing that Jailhouse, as one would expect 
> from a hypervisor, uses 2nd stage translation to protect VMs (cells) from 
> accessing each others memory (unless a memory region is explicitly shared 
> with a root cell by specifying JAILHOUSE_MEM_ROOTSHARED). Is that so? 
> Could anyone confirm? How is IPA<->PA mapping is done for VMs? Is it 1-to-1 
> mapping (so that, in fact, PA equals IPA)?
>
> Thank you very much in advance
>
> Best Regards,
>
> Yelena
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/06ab8036-e7b6-458b-990e-2f685b5fc857n%40googlegroups.com.

------=_Part_5337_163645818.1669317575926
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,<br><br>Answering my own question :) :<br><br>I have run the demo fr=
om https://github.com/siemens/jailhouse-images for Raspberry Pie and simply=
 collected the output of "cat /proc/iomem" before running Jailhouse, then a=
fter enabling Jailhouse in the root cell and in a Linux non-root cell. From=
 that output it looks like Jialhouse does 1:1 mapping between IPAs and PAs.=
<br><br>On a platform with Zynq UltraScale+ MPSoC, onto which Jailhouse has=
 been ported, I have experimented with memory accesses, trying to access fr=
om the root cell the memory allocated to a non-root Linux cell and the othe=
r way round - trying to access from the non-root Linux cell the memory allo=
cated to the root cell only. As expected, in both cases I have got "Unhandl=
ed data write...FATAL: unhandled trap (exception class 0x24)", while the ce=
lls can happily read from/write into physical addresses belonging to their =
own memory regions specified in the respective cells configuration. This ap=
pears to confirm the use of the 2nd stage translations for restricting cell=
s access to physical memory. &nbsp; &nbsp;<br><br>Best Regards,<br><br>Yele=
na<br><br><br><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_a=
ttr">On Monday, November 14, 2022 at 2:19:55 PM UTC Yelena Konyukh wrote:<b=
r/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi All,<br><br=
>I would be very grateful, if anyone could explain how Jailhouse on ARM64 a=
rchitectures uses the 2nd stage MMU translation.<br><br>It does look like J=
ailhouse uses the 2nd stage MMU translations=C2=A0 - for example, t is easy=
 to find in the code where such registers as <span><span>VTCR_EL2 and VTTBR=
_EL2 are set. I am guessing that Jailhouse, as one would expect from a hype=
rvisor, uses 2nd stage translation to protect VMs (cells) from accessing ea=
ch others memory (unless a memory region is explicitly shared with a root c=
ell by <span><span>specifying JAILHOUSE_MEM_ROOTSHARED). Is that so? Could =
anyone confirm? How is IPA&lt;-&gt;PA mapping is done for VMs? Is it 1-to-1=
 mapping (so that, in fact, PA equals IPA)?<br><br>Thank you very much in a=
dvance<br><br>Best Regards,<br><br>Yelena<br></span></span></span></span></=
blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/06ab8036-e7b6-458b-990e-2f685b5fc857n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/06ab8036-e7b6-458b-990e-2f685b5fc857n%40googlegroups.co=
m</a>.<br />

------=_Part_5337_163645818.1669317575926--

------=_Part_5336_815689083.1669317575926--
