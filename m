Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQGZ3D6QKGQEADN6PKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D4E2B8D14
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 09:28:48 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id u123sf2141395wmu.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Nov 2020 00:28:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1605774528; cv=pass;
        d=google.com; s=arc-20160816;
        b=ihY6awMvxgJGSL9jZ0VnGkuEW9YZXe2fJ9zbKIlzdf8GnyvlUbp6ZyrM5OVy3aNGpZ
         XPBSikEaSAXk49RsULGK7dK6otNDBXKuqAx7qFY6O+p+65IdHbh5yF523zGTQJ+WIDE8
         Hb3cg1+yyaIUwM+DYz+IRQpoDzu5ZBqTTrjnJH61XcE1OqaMuEAIWF7adMdnGRxRtEKb
         ivh7nG8pwXxRddFuHFIo/CEm1WrNHqDepPI+zpiOZ8+c5votnkWYiKTn6PxDWm0u11HR
         VdQ5Yyh6iCudwin6dps9PROk9W8BVSD8CZj52z2AA+Ujod04XnZ4h9waLnaM1eKcIa2Y
         u7Uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+nsU/QVLzL3A4Cc/7Ro1Mi39fZekJYaVdqHqvfc7Mqk=;
        b=JOjIy+jvjadn/e0yei5KrAB4S24C3bu1Io/QYLNoO+4W9SXj+jXGqJ4Jc+1+WGGDqa
         OJhK5ssL8ptbVA6sJjIDIdGpIkvNQAmXoiyoFWjc0AtfayuXCghNVCJBBvOa5ljgHAj9
         q62kQUiqy6iz5O7tY5wVu05hKMmpLQiG+fXV49qAKQR3DSeU99tGfBgR/mmJXZ2nhxVJ
         DXGAZdADZciNjRPESnj/07fyOdX7/S2hkCcy6LcTh0+GAV6EHjMHMjQCjFN4MM3U+d27
         Faulcn6+Ol6UnLQFWXpVdieN3bxwWLgk8FWGwuf3KJoxH7tYp9BOWqyfFRlFZxRnCBtM
         PnHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+nsU/QVLzL3A4Cc/7Ro1Mi39fZekJYaVdqHqvfc7Mqk=;
        b=otikgrfqgXB4Ptm6c0k+1mvMoFgt8PnbXCb5sR46CqJzu8lFYxx4WNh+eE3YdjikwG
         yt3xbLyZ1Ijx2ZH8v5SpmpuUXdeSMLVHXNfklWi8edSE+5gRWA/qFt+rkpRhE9ns+sGH
         krW/aqFYAdLE2VuYuw1z7bKuekR9ragIVks/KaWXnCa2brFs2FeP6d6H8u0/EL0DSLIK
         tlFZggzuyVq/8CGZ9TkYmfuWKlE1zsc6Znc0y11BHNP8ahVD/OKF6u06GEiccl9GOIS8
         xN+x5T2wVhtKmwuH7i3QjFW3HBWxaJNQnusbVNdGQHrZOM9MQZHepKT2zkfDIwk9OI60
         suig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+nsU/QVLzL3A4Cc/7Ro1Mi39fZekJYaVdqHqvfc7Mqk=;
        b=PljsFaX52EQxW7QP4oAXPBwJBpvtMlvjPZOVaEei/F+OAWnTFM4TB8EbktDdvomeiu
         ouGgK3h5S/5KazwHOs26atE0G7U/tXvwxoLm3QZbDLUcr0WbKcf7NkOdzA/E2trsOuEx
         am7j09kJdKEA4rAjHDAcpgSXwPFX9GtgeT0DO/8OAVtiWKo+H3i0jVBNj2wolnx5AWPZ
         pznWbJ1NhbVMsxHS//ONJ/Qptb8Z+xEH5bhh8EETNg6eiBB6XEhLdrTLEA2j+9RPnQjd
         5ePUKYZrZ9BurLrlWISZWbYD6Kk4ZZSOuQ6m1dOsiguy52yuZI3x375bk2osTESB1ZG8
         Ww3g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533f65g4X+rAFApZ3NHcp6pZ+QBeEx9KZTYPj+UyYP31PXtK2G7x
	YpLtTH2NYZCpJw7HfSddU1A=
X-Google-Smtp-Source: ABdhPJxHY0N72F9WLUFZ97TpNqoEP5iL4f946CWIwk91s+mCsVdgSaYg2oKb8O39OBv1X08niXPvWQ==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr3406274wmg.121.1605774528535;
        Thu, 19 Nov 2020 00:28:48 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aa87:: with SMTP id h7ls2591325wrc.2.gmail; Thu, 19 Nov
 2020 00:28:47 -0800 (PST)
X-Received: by 2002:adf:a54d:: with SMTP id j13mr9372975wrb.132.1605774527555;
        Thu, 19 Nov 2020 00:28:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605774527; cv=none;
        d=google.com; s=arc-20160816;
        b=HE4DWN8WnuliOaGFSoQV+C7+Jro/vh0n59S5evSpv8Mx78SjA0AXVSTPUCvObRYQS8
         JrGCbIyGvY3yKNaCaodYWfpnKLCQ1Lx59Ai3BLOGE/L9GgfoL+nrLd2Y+dzDqzQrvruH
         d0XsP5guFnlRsDRBigTt0N5InSz7AipDXcuRLC+tTbxKGSf1ho0kBa5URPp2bU+Zsa6X
         7OgVruYyZKNufZKkXsmYOeul8PUzMOcwnHUeMABw3z5Vf5vsuoIXf5zlQEzdjJsEUW+M
         kR07HXsab9aW1M7obYWZsjcO5Gdbt329bQwWdX5999AUN62xz07DxeWn68pg7Vndm8LV
         O7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=BPh2Se6wzoyudRxzJw7SQz1DJW2kgsz9pTIkb50OR8o=;
        b=wZeRGHo/eo/PrbF7z0M6ordw8yUXu+HFI8uZcOQ6F3o2+kPmYPoQUgS9m0BoFwJZEu
         iv233m9VLNk5U42y489i6xtEo+PUv3JrjWmxPPamYIRMDbMhEmQlfh+l0JhFagAcH43z
         mk2SH+/EutajhNzoBxgATRCFj/gUxvIYsyGBxB5PEG3fIiojRHrehteb5wRYFFScS4HW
         Dt0028eAX2TVKW62uYo+CSLVwQLxh8jgeFz3bEm5Yzff8zNRr4iiMkDdBB9iouyY0/N0
         SeIvre87GaKA+O0d9vXs+FwWWkDonrbiOVZOce2lUFanjoibyQQZakthiZHQKxqs/wJn
         9CjQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z83si283800wmc.3.2020.11.19.00.28.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 00:28:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 0AJ8SkkR020697
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2020 09:28:46 +0100
Received: from [167.87.38.29] ([167.87.38.29])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0AJ8Sksi025852;
	Thu, 19 Nov 2020 09:28:46 +0100
Subject: Re: one question about MSI-X support for vPCI
To: Peter pan <peter.panjf@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
 <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
 <650b2d0f-b721-44a4-9572-28c2a88a7559n@googlegroups.com>
 <aa38bda6-400a-4342-8b72-e033c56fd89dn@googlegroups.com>
 <9ea3bc46-677d-7e23-0bff-70d0218898da@siemens.com>
 <581e32ac-d032-4108-b4fe-21286e6b2085n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <803d46bb-b51a-6fba-7bfc-3e6d2145a8cd@siemens.com>
Date: Thu, 19 Nov 2020 09:28:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <581e32ac-d032-4108-b4fe-21286e6b2085n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 19.11.20 08:52, Peter pan wrote:
> Hi, Jan,
>=20
> After some investigation, I found the root cause of the issue: the
> carrier is not
> changed to be on if we open virtual NIC in inmate firstly, attached
> patch can
> fix this issue, please help to review, by the way where I can upstream
> this patch?

Thanks for the patch!

I'm just wondering, given that ivshmem-net is conceptually fully
symmetric, what is causing this issue to only happen in one way. Guess I
need to study the scenario in details.

Jan

> Thanks.
>=20
> Best Regards,
> Jiafei.
>=20
> =E5=9C=A82020=E5=B9=B411=E6=9C=8818=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 U=
TC+8 =E4=B8=8B=E5=8D=886:01:51<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>=20
>     On 18.11.20 10:50, Peter pan wrote:
>     > Hi, Jan,
>     >
>     > I have one new issue and not sure it is a know issue.
>     >
>     > The issue is: when I ifconfig up ivshmem-net NIC in root cell first=
ly
>     > and then ifconfig up ivshmem NIC in inmate cell (runing Linux),=C2=
=A0 I
>     can
>     > ping through between two NICs, but if I ifconfig up NIC in inmate
>     cell
>     > before ifconfig up the NIC in root cell, I can't ping through betwe=
en
>     > two NICs, and I found NIC in inmate can only receive packet
>     sending from
>     > root cell NIC, but NIC in root cell can't receive any packet and
>     there
>     > is also no irq received for ivshmem NIC.
>     >
>=20
>     The link states of both virtual NICs are up (ethtool)? Is there any
>     ivshmem-net interrupt received at all on the root side? There should =
be
>     a few during setup at least.
>=20
>     Check that the interrupt line on the root side is really free, and al=
so
>     that GICD is properly intercepted by Jailhouse (check mappings).
>=20
>     Jan
>=20
>     --=20
>     Siemens AG, T RDA IOT
>     Corporate Competence Center Embedded Linux
>=20
> --=20
> You received this message because you are subscribed to the Google
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send
> an email to jailhouse-dev+unsubscribe@googlegroups.com
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-2=
1286e6b2085n%40googlegroups.com
> <https://groups.google.com/d/msgid/jailhouse-dev/581e32ac-d032-4108-b4fe-=
21286e6b2085n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/803d46bb-b51a-6fba-7bfc-3e6d2145a8cd%40siemens.com.
