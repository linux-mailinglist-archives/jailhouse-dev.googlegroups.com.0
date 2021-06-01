Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5OJ3GCQMGQEXXPDAOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3f.google.com (mail-io1-xd3f.google.com [IPv6:2607:f8b0:4864:20::d3f])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7639786D
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Jun 2021 18:48:55 +0200 (CEST)
Received: by mail-io1-xd3f.google.com with SMTP id w17-20020a6b4a110000b0290492680338ecsf7499538iob.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 01 Jun 2021 09:48:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622566133; cv=pass;
        d=google.com; s=arc-20160816;
        b=aUpe33PTmIlH+6JSvkPx7Y5ANkaTp7NmrnQWGyO/ezZpL29CnlLtQiUMmtHA12/4Zt
         NLObXdeCaHLsPv4cKuchT1hBqIeSmatWeQXGByDkY7VjAk1nSKoJ70R6JG8aGBmm0DjO
         O6rN7A/TE+jDsnoVsg3z1edRGvEw5iqKAC9bhWFsbG5I/8OYx763L0axey85R/nsVsK9
         K8MnOTBRm5IMJqf6VEKwx9K4xECB2AXw1kV9y+OaE1ArLzgqebvKpR5ts8UfkEoKKI+l
         4NykHN3+15nXmWHCv6qkrWcjqDcy/j9mTPBfra+fDxceJlvISuABszWL4EnZLatUOPhZ
         mYWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=XGKzi8StGH63v2Ft2KW4c7fzU0oc5eFakeKUXPRigzo=;
        b=ngtWidXdEFWrHFoDHLuOSD6MPA++b3SXtqYFTr8F9tSZ0uf3dUYPmxZ9kUmCvOuibf
         fQFKzb8WC18pqpfxqYzViHo6O97madVV5f57di0gqP9bxVDtDyZ99ebAHrhx4rHt2bOp
         uvaPPEs5EOaRpikXjm3bBZ+kutuiZTSDs3HQ/1O6iR32zGA1EKWK1pV+0EKFcQeBetvh
         ibhX0XXTLx6XUR8e3S6FICEvp2IhMj0lZWQTWysLdNwe4ReIJbzYsJ6I0d89Im+WF+zz
         mMWNIxCdSVtqUiPe1XMehZNOlJ15MwGRT0rTVDtRmMPc6YaYW4vL7sBGRrkxpV1gaYeZ
         nFWQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XGKzi8StGH63v2Ft2KW4c7fzU0oc5eFakeKUXPRigzo=;
        b=GB5Tl7nga20SNewkjQeCcJM0tYV5U1oYRwfTpXsYzvjuum8aRkR8ztllNpkZC3S38P
         w8e+Mr8Hdl7uxW3bLaz82kEgYvPjZjhkSz32cLDWC1RdrxENpnz+yY2vSOJYl0PIOCXa
         v5OfCbm/feVATK8cHoNFbHDjAyo73x9rf8DGhjPmOQR0cibNm3n02g7VGJNv5CZ8oGDI
         +jjAa1u2bBWP1DrvitNI0DjXC7PrqQsjjhmkg8TWm02gplvrTofA1jWeMhAQ+l+iy9+g
         bXB6wRyp8pvRmXDSeCIZqy99TdHMfeIaY4yk+ez3vIGTyOW/o0BoqKTFlwzBfhQeQqyU
         oLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XGKzi8StGH63v2Ft2KW4c7fzU0oc5eFakeKUXPRigzo=;
        b=H2tKh9hnSDHHZSdND/UcZ6/lH5la+Jp+5h6VYVFm2hQeNL6qv8lPKxjRJWGFYaYPwj
         RAlXlnjemGUqxnr1+hvD9Ze78fajEbuURr78Ls3s+VkcvuwNKY9G+bexuiqg9sR4wHkO
         x2YAIZUwyfMGYEPFUs4w/g+EyZLS0uMGsHqs09Tqz6Hd08vrcnK9m+JoTSzxtewxN8+9
         TgiOND0K1YKjBAt53ZeiiTrCtEvTJo44pcPJ9tGi2oRNsxbzYDBYl+SQEuAXBWeBLrqQ
         nmk/WMfoCrKQuSW/TXU8YEMSRgpamF/dCH3tkB8dK+54+RR9f9sO8RglNmPqEhxjXFFn
         6kQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533teJ9sdxQrRNuWyj4PZxlG9YpxggPMGeBuCgAgbjIGh2SOENjc
	gl5CHeVxi2rs4OPafi4Tg0k=
X-Google-Smtp-Source: ABdhPJygUlqpZh7pwYO9Ve/PFhN5yqyKtXZiPmdi+cPq2HZWgENKXCC/xqJWpsSu914ocJKPYNjKzw==
X-Received: by 2002:a05:6638:1650:: with SMTP id a16mr25866883jat.23.1622566133769;
        Tue, 01 Jun 2021 09:48:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:88d5:: with SMTP id i21ls2335465iol.2.gmail; Tue, 01 Jun
 2021 09:48:53 -0700 (PDT)
X-Received: by 2002:a5d:9acd:: with SMTP id x13mr21585556ion.134.1622566133330;
        Tue, 01 Jun 2021 09:48:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622566133; cv=none;
        d=google.com; s=arc-20160816;
        b=ztCM0y03hFEQbfntTwYqkNFEDkuw1CxZ9YPnsysS5didinnX+QtrBPoxzdsWaUYulP
         2B+k9F0mb3vIKDVtx3eR+oxx6SsugKVsZo32XHw8kp/EZ22P2ikM+9dUNLf7X/5oq741
         irdayAMje4tTse7uav3OPyYzEa/bD1r47rW7kTCsz3DTX1QqRAKeGDqaQ+e5c2kWevCB
         8pezUW3sulL25ok9E4CqtsN/xe3pDaA3NZ6Qv8KCy1er7ATZDGTuhD3s0Y5mR6fxQ9kz
         b32JVUeHiBZ7Q9YUKXelB6mEPYalqT5SmPaOURBVkNrQLpUHgp1qGy5uzo+gwCj5sBZH
         AC+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=x2KoFU+/7Mq4k1GKXaDaQKm1B0mS1WVjlbqp6bX70Co=;
        b=PC32mB5ue8p9tNUe70v+jsYz4wBBSVKkggQ1LZ1Jhqcmk4i8P//6nY8/C42oAURJhm
         G3mwVVAID1X1Le7bal1Og+72goW0pfn4GvIoMNi8ci0Z99FYzU7S5UpaGH4qXjojGn6t
         ScXydoiTZHIbHFjO2pyqjcxOICDEvx5qrW4T9Qv2RGYBbrYeaZM6NIN+Fp/gw2Iz/rgR
         Sf0XBaqyq1/3E6O1G824iwr0NdH3waFsv0Lt7kcRagixFQ4eGXyjvOEi1QAaQJ8Au2eN
         lIKgrKqFK5uVAHGUhw7Yrag5zLwLrr7g/8FB+PtBPHiizZLYLE6KG9RecdnEZbtiXztI
         86EA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a2si1232302ili.4.2021.06.01.09.48.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Jun 2021 09:48:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 151GmnPR022510
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Jun 2021 18:48:49 +0200
Received: from [167.87.91.190] ([167.87.91.190])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 151Gj7aF007835;
	Tue, 1 Jun 2021 18:45:08 +0200
Subject: Re: The right configuration to partition pci device into inmate for
 QEMU
To: along li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
References: <31493abc-ae9a-42d9-996c-edf630f2456dn@googlegroups.com>
 <a829b501-b59d-d9f6-531b-6ad07667d2a7@siemens.com>
 <f572fb5e-9d0a-4b8d-abc5-7aab1590aa58n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <06029a86-0a3d-0456-f3f8-51d123b27a1f@siemens.com>
Date: Tue, 1 Jun 2021 18:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f572fb5e-9d0a-4b8d-abc5-7aab1590aa58n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 01.06.21 12:04, along li wrote:
> 1.=C2=A0 about=C2=A0 Invalid PCI MMCONFIG write, device 02:00:0, reg:110,=
=C2=A0size:4"
> I don't know why show this when use original=C2=A0 .c configuration.
> After I added this, it=C2=A0 doesn't=C2=A0 show error.=C2=A0 I don't know=
 why.
> =C2=A0{
> =C2=A0.phys_start =3D 0xb0000000,//mmconfig
> =C2=A0.virt_start =3D 0xb0000000,
> =C2=A0.size =3D 0x10000000,
> =C2=A0.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> },

The PCI memory-mappped config region is special. Jailhouse needs to
intercept it in order to manage PCI device accesses, their visibility,
MSI/MSI-X programming and also allow for injecting the virtual shared
memory devices. If you pass the whole region through, guest may see
devices they do not own, and they will program MSI vectors that are not
valid in the light of interrupt remapping.

>=20
> 2.=C2=A0 about qemu version
> The qemu on=C2=A0 ubuntu 18.04 default is 2.11.1 =EF=BC=8C it run failed.=
=C2=A0 =C2=A0 The
> network card e1000e=C2=A0 will go down after ifup=C2=A0 eth1.
> I change to qemu-6.0.0 , it sucess. Maybe qemu-4.2.1 is also ok.=C2=A0
>=20

"failed" is a vague term, so hard to say what is the real problem.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/06029a86-0a3d-0456-f3f8-51d123b27a1f%40siemens.com.
