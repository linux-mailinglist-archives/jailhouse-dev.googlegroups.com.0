Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBPXX3X5AKGQEQ4HZEIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73f.google.com (mail-qk1-x73f.google.com [IPv6:2607:f8b0:4864:20::73f])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D5026117D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 14:40:31 +0200 (CEST)
Received: by mail-qk1-x73f.google.com with SMTP id s141sf9043944qka.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 05:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zClm4/7E4S0YuEWEVyrcVdYlLPJXaLK2OZUxm6NFc0s=;
        b=oNl13PBqm1EaE7JEWo9MTiG0yhiIcq4mVFVd3EzdlK1aleQGlQk3Zlt5bIltOZz2eX
         pphNOQuHvJW9H9lPW1E/YadES6guK+mReCbE8fS0ysDAQC+DM2mxV6bPiEUJCVZS3AaN
         IM9REYxfl2qbTejd2TK38jijrzA4NbM4215iZOdlXGv1kaHqjuegDQR3GI0juxQ6sLLt
         p7ABSFNsjfiThEEGdVCDkoEq9ZXrCCcPDiIWR5Bt7d68QDBo8i5j8mfZ9DPpXwtUO7BL
         Eh/Q5EtCSIaunA2IXQIpidn8gGqDekSPCOsvPo2cOGBmbouznXnk+gnUsSd6I7OqSUEP
         hOYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zClm4/7E4S0YuEWEVyrcVdYlLPJXaLK2OZUxm6NFc0s=;
        b=NoUR9or8BBPYNzsfKnX0rdOm1CuGfxKwZ5Ouy+Oik7KbgdGHF4PWRzWcDKwR6C40WJ
         h/BTWFXzr1ce+m8YWHbfq18jsyfJoCjUZjEAP/nkC1iYApNSAGT3jg3FNqA2niF+a7Pv
         2O3chVyzxvI5gTz5TDccEPD1zbno+9xUaFTOSrmXMaGpMOaJOnxAszNwX/Xe9MSBzp2L
         WlXziczM2b6j9kSpfKF58WrZhfibfWIU43VnPUJSOlEFT6b4sf8UZmrSoF4dnRLsF4Yz
         64bewCMJVDQISnplkIYkb6EEixZbuL0e7gqcevzBnJo+pI6CUAlq+yrSFIWBR94sDc1I
         brKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zClm4/7E4S0YuEWEVyrcVdYlLPJXaLK2OZUxm6NFc0s=;
        b=r84RH1So57EWbYKgvpplIiGVInU0Kytn9Wh2nlOoGEQ3cyZXnezcBP5flRiS+lUfID
         AQsuHM/8yyEiw7RMIZzBTRx2I4iAwtLqxgHq2wbPKSXQS7lNnwL2MQnfUXT70kcJ1jYs
         41pevjam58ePvblDqLy9aQ0qftD9/6/dO6VTmsE9pEO41yVb/Nim/9bhdIY85dfEK7UO
         Oj5D/nJTT1nCdwxmMcUqRG57YcG9nEzcea7odXBbHKwijiFXwMtQom1ggSI8K/pUCSWz
         Vrx3FN1r3+H26iGmk26ecnt2WIohdFpKnJ/kso3yjXLEic4IMfA7ixFUQcAmX73tkQFV
         MWmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53019OtdBOHvd6nsTz2OpBPW2ea11oHNYPQIyaOPmP9iBsmJJEOw
	+aGbhtjOOwmuRpQfUGqziKc=
X-Google-Smtp-Source: ABdhPJyghrxuxVQt5ZTP1powcRTbPeNGVhLm67aNSERsGIUrqNLFUOJ4DnnofYGdgr8qps05uMDD4Q==
X-Received: by 2002:a0c:8e4c:: with SMTP id w12mr23057819qvb.3.1599568830782;
        Tue, 08 Sep 2020 05:40:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4c91:: with SMTP id bs17ls1814236qvb.3.gmail; Tue, 08
 Sep 2020 05:40:30 -0700 (PDT)
X-Received: by 2002:a0c:9142:: with SMTP id q60mr1026772qvq.13.1599568830038;
        Tue, 08 Sep 2020 05:40:30 -0700 (PDT)
Date: Tue, 8 Sep 2020 05:40:29 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0acc82dc-fbc9-4d81-bcde-69e611aa01b7n@googlegroups.com>
In-Reply-To: <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <CAOOGbpgwq0=B85FFAaPCGC+W3UsFYtp6ROAsCbUdD2=g_Ak1kw@mail.gmail.com>
 <b501a3d0-70cd-2126-8fa0-fff217caa20c@siemens.com>
 <6765e219-706a-4124-9ac2-d40109d69f7cn@googlegroups.com>
 <2924a8c6-5b7f-427a-846e-9fc0e64bad53n@googlegroups.com>
 <6ab98ec9-0255-830c-589d-781da3bd2838@siemens.com>
 <cc674085-e9fe-4bd9-a591-47593459c6f2n@googlegroups.com>
 <138c5784-6dbd-add0-2364-9fef4b7a9ea6@siemens.com>
 <de0ebbce-9513-4820-8975-781f816f9841n@googlegroups.com>
 <0e52381f-15b2-e833-7717-6335ddcc5f35@siemens.com>
 <CADja47McPVRWvi8u_fP8z7ZqPGcdW324AKG2e0iK_osTCd=Qkw@mail.gmail.com>
 <6f67008c-1b56-4c4e-9442-d011d178e895n@googlegroups.com>
 <6ad242dd-b69f-4176-a10a-1e84edf3b670n@googlegroups.com>
 <033bbd67-9d28-c615-2120-765f0a93ab00@siemens.com>
 <276eb4de-5351-474f-a8ae-a0a038056c78n@googlegroups.com>
 <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
 <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
 <c31c0a2f-17a4-d970-5f5a-7d26a148a740@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3538_299157287.1599568829128"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_3538_299157287.1599568829128
Content-Type: multipart/alternative; 
	boundary="----=_Part_3539_65322834.1599568829128"

------=_Part_3539_65322834.1599568829128
Content-Type: text/plain; charset="UTF-8"

What do I really need in the kernel configuration and kernel command line 
for IOMMU support?

If I set 
CONFIG_IOMMU_SUPPORT=y 
in the kernel configuration then the system starts.

If I set 
CONFIG_IOMMU_SUPPORT=y
and
CONFIG_INTEL_IOMMU=y 
in the kernel configuration the system does not start!

Setting 
CONFIG_INTEL_IOMMU
also sets
CONFIG_IOMMU_IOVA=y
CONFIG_IOMMU_API=y
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
automatically.

For the kernel command line there are two options:
iommu=off|noforce|force|...
and
intel_iommu=on|off|...

What do I really need for the hypervisor "jailhouse"?













-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0acc82dc-fbc9-4d81-bcde-69e611aa01b7n%40googlegroups.com.

------=_Part_3539_65322834.1599568829128
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>What do I really need in the kernel configuration and kernel command l=
ine for IOMMU support?</div><div><br></div><div>If I set <br></div><div>CON=
FIG_IOMMU_SUPPORT=3Dy <br></div><div>in the kernel configuration then the s=
ystem starts.</div><div><br></div><div><span style=3D"background-color: yel=
low;">If I set <br></span></div><div><div><span style=3D"background-color: =
yellow;"><span style=3D"font-family: Courier New;">CONFIG_IOMMU_SUPPORT=3Dy=
</span></span></div><div><span style=3D"background-color: yellow;"><span st=
yle=3D"font-family: Courier New;"></span>and</span></div><div><div><span st=
yle=3D"background-color: yellow;"><span style=3D"font-family: Courier New;"=
>CONFIG_INTEL_IOMMU=3Dy </span><br></span></div><div><span style=3D"backgro=
und-color: yellow;">in the kernel configuration the system does not start!<=
/span></div><div><br></div><div>Setting <br></div><div><span style=3D"font-=
family: Courier New;">CONFIG_INTEL_IOMMU</span></div><div>also sets</div><d=
iv><span style=3D"font-family: Courier New;">CONFIG_IOMMU_IOVA=3Dy</span></=
div><div><span style=3D"font-family: Courier New;">CONFIG_IOMMU_API=3Dy</sp=
an></div><div><span style=3D"font-family: Courier New;">CONFIG_DMAR_TABLE=
=3Dy</span></div><div><span style=3D"font-family: Courier New;">CONFIG_INTE=
L_IOMMU_FLOPPY_WA=3Dy</span></div><div>automatically.</div><div><br></div><=
div>For the kernel command line there are two options:</div><div><span styl=
e=3D"font-family: Courier New;">iommu=3Doff|noforce|force|...</span></div><=
div>and</div><div><span style=3D"font-family: Courier New;">intel_iommu=3Do=
n|off|...</span></div><div><br></div><div>What do I really need for the hyp=
ervisor "jailhouse"?<br></div><div><br></div><div><br></div><div><br></div>=
<div><br></div><div><br></div><div><br></div><div><br></div><div><br></div>=
<div><br></div></div></div><div><br></div><div><br></div><div><br></div><di=
v><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0acc82dc-fbc9-4d81-bcde-69e611aa01b7n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/0acc82dc-fbc9-4d81-bcde-69e611aa01b7n%40googlegroups.co=
m</a>.<br />

------=_Part_3539_65322834.1599568829128--

------=_Part_3538_299157287.1599568829128--
