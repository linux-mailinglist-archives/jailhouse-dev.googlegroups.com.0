Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB7VT3X5AKGQENDB7KIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7E7260F7B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 12:16:31 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id z27sf10305289qtu.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/En9bxF9vYxn8Fj1C8IyiLiEStM9dS4pW60GXSWiOeg=;
        b=FxIRgJIv0mlWt7Wo0ny9crLKELDGjySRiapGn4G1Bt7mfbfWl5k7GcXenCVWsxlmR9
         7bEicuEUvhL6+5kK/SsmlodUthr4zf2OyIhLgMJBm3a4+CA30YqMXxqWwOk7U8vWFdXM
         WKiyUuBirPS3e284tKpEvCSnSJnICsa2AeOPgnQg+G7sJLVVjyN8UIbdQzTLnInH/s8O
         KdE37sUyitaq8AZJL2MdE2DJTZuvNPKGhT70wacs+vuRMDoy/3EjqKLxzar4MZWsVVii
         37I5pfitTBMlVe71fZa2Plr335Xxtey6C6SKpMgeXfI9xF3YV5mVgMunnHPVm4vW9/1v
         Y9Dw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/En9bxF9vYxn8Fj1C8IyiLiEStM9dS4pW60GXSWiOeg=;
        b=H/vdZG6F36tgk9y/74YeCEXX9Tgpat0aiJ0/NPEXJxFpltSXG7QP9xlocuwK5r7BR9
         ZHjI+KP6PWAKaoio4mYj0z6FJ2ZszXgSlpWJpOfVoPLXZWlqYvkviPhaDeTFc691U/sk
         jAAlg5BXqEDnybTqQ9S28JCPG6MJvJPfvMM0GEOg7VjLH+BmPVmaL6Dl5hfZp5t10Ao7
         Y3nnYiKywKjiKlCZaNIIRcfGUSb0iMKDWbK3zyTt1/Cfhgk519PIIa+3n/FQFC4A+n0J
         ZJAGX7poqYnqTkkk7Vkt209zo3W43o0H/4hVZ3iP+xSOUuFj6+VS9y6RfPnUjTo+KTIF
         89iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/En9bxF9vYxn8Fj1C8IyiLiEStM9dS4pW60GXSWiOeg=;
        b=Lfu24tp1crxymE9m98it/9Z9GSLAN76A3UOTSiYt8lS17BIFOZNgxq/HjPz6hPAFwI
         j0+N+gy9xrTn8Ds+O/1L/tlXttvfP/0C2T1jtUvmnxeIuVh2YxLXQs95CBDP5Uq+vhLd
         R2e/JGlUWPC+/oVLTs/18xzdyJds7QvIGufjdECTIwpkfivbrJaVLMdaveyPCP4rn+eG
         S5GxOjLBbg9jhrDhVeZlew6WGAweOtA22KkZ1fHYe+eFmMi7wkn2DvLYbVwdpK98CryR
         H8+i9r+u4FKAWJfvPpx3YVwxF5/hkAx31OYPnAmNYhoM2toUsDrq5Xuu7Sd4KzaJf7yI
         fj/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530ubFFCdjA4GTN/d/yVLD8El8jqLveaSI1LATK+N4xNZpfdhYPn
	CcBQTKE75tUYWBVpleGo6Oo=
X-Google-Smtp-Source: ABdhPJw6iyFfPWfuicIrOTAvX/mtrAWc5nnCAmobyRglYGiF/u0IIL6IsC3LxooS4sHAmW9UM7dXig==
X-Received: by 2002:a37:a143:: with SMTP id k64mr23597459qke.266.1599560190709;
        Tue, 08 Sep 2020 03:16:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:146b:: with SMTP id j11ls8719137qkl.0.gmail; Tue,
 08 Sep 2020 03:16:30 -0700 (PDT)
X-Received: by 2002:a37:8a44:: with SMTP id m65mr11836170qkd.47.1599560189952;
        Tue, 08 Sep 2020 03:16:29 -0700 (PDT)
Date: Tue, 8 Sep 2020 03:16:29 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn@googlegroups.com>
In-Reply-To: <199d40f2-9ca3-d618-101d-d7c33d450af9@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <CAOOGbpg5t1ykh1OaS_rKXMzfL2u9F+igLuoA3wSg4boAhxtuWQ@mail.gmail.com>
 <9ff0b838-a854-3ef0-6487-dbda6d488184@siemens.com>
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
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2472_1251573161.1599560189188"
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

------=_Part_2472_1251573161.1599560189188
Content-Type: multipart/alternative; 
	boundary="----=_Part_2473_2102880601.1599560189188"

------=_Part_2473_2102880601.1599560189188
Content-Type: text/plain; charset="UTF-8"

Thank you for the explanations!

For the IOMMU support I have to activate some options in the kernel 
configuration:
CONFIG_IOMMU_SUPPORT=y
CONFIG_INTEL_IOMMU=y

However, there are numerous other options:
CONFIG_IOMMU_IOVA
CONFIG_IOMMU_API
CONFIG_IOMMU_DEBUGFS
CONFIG_IOMMU_DEFAULT_PASSTHROUGH
CONFIG_INTEL_IOMMU_DEFAULT_ON
CONFIG_DMAR_TABLE

If I activate all of these options, the Linux kernel won't start!
Which options should be activated and which options shouldn't be activated?

Best regards
Jan.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn%40googlegroups.com.

------=_Part_2473_2102880601.1599560189188
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank you for the explanations!</div><div><br></div><div>For the IOMMU=
 support I have to activate some options in the kernel configuration:</div>=
<div>CONFIG_IOMMU_SUPPORT=3Dy</div><div>CONFIG_INTEL_IOMMU=3Dy</div><div><b=
r></div><div>However, there are numerous other options:</div><div>CONFIG_IO=
MMU_IOVA</div><div>CONFIG_IOMMU_API</div><div>CONFIG_IOMMU_DEBUGFS<br></div=
><div>CONFIG_IOMMU_DEFAULT_PASSTHROUGH</div><div>CONFIG_INTEL_IOMMU_DEFAULT=
_ON</div><div>CONFIG_DMAR_TABLE</div><div><br></div><div>If I activate all =
of these options, the Linux kernel won't start!</div><div>Which options sho=
uld be activated and which options shouldn't be activated?</div><div><br></=
div><div>Best regards</div><div>Jan.<br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/b7dd4477-cf1a-44e5-9f7d-5c0bb474d26cn%40googlegroups.co=
m</a>.<br />

------=_Part_2473_2102880601.1599560189188--

------=_Part_2472_1251573161.1599560189188--
