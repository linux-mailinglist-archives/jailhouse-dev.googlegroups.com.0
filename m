Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBWEPZTYAKGQEUXOOC7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1039.google.com (mail-pj1-x1039.google.com [IPv6:2607:f8b0:4864:20::1039])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D12131012
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 11:11:38 +0100 (CET)
Received: by mail-pj1-x1039.google.com with SMTP id h6sf10637148pju.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 02:11:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578305497; cv=pass;
        d=google.com; s=arc-20160816;
        b=VIR0cxZx/NeglcBq16Rh4h4+AAY9vqEBHOKIS8UzVNFhMrMGhv2zDdrojXRjlyhpv+
         iNGbcNBitB96mjKL35xn+IQ9miUDsqdrQ4NPRQX7hgZyyM8lToqL+d/qqxqa0AlhB4m2
         K3uH2W4dp8RI5TjVyMuoZUWdkMypmRmyPUFRsAdlMPYOIPb6WH9RWMj4GJmpdGH2ILip
         dHjE74MIcIKTD7ZfOaYwrjXf9j+e2cs97J/e3yixks60ev/KXYi+eSJ+WbEA6x4YnOJx
         jIN9YywA+K+e6RYP+YLlrk2KiKnRkqffa0uxfZzFA2UTBjXCukruRIxevRdehlLP/myp
         FIDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=rfmOlZ8jir+EAMqX4PnVHLabHxKtr2ch7udqzGjAVnQ=;
        b=R69mo0l4WWht9vfa8WrJ1Ufxti2bAqIIIgF+WQn/y33wrsQqe+1IuKhZ2miUTcw8Kx
         N7JABwZhNrlyTGL0YP7RdSM4I8PMW6Nqg+szYDqwFzBW8SgWKJpx2ji7crZumCHfKeY5
         pVBK60nilFNW7O+XyKsBX/pGBPjKE+LneEbb17XMR/QHBbCsDL8Sbb6aQ9wkoI5VpiMZ
         +Yarr2M1hDUDiOQAo3VCc8FmfDItLCl9vOk/0JZCg1RiAfa3RFcwgKJeA1MS0/1hBB/9
         qLCn4qjr11L3QoRzosBKX9ZZdblofmUaKhs+r5fH0cWopE2HmpZ/53112GcOxPDx0Hqn
         nrlQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mZf+PCS1;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=rfmOlZ8jir+EAMqX4PnVHLabHxKtr2ch7udqzGjAVnQ=;
        b=r+I6C6JE+e1lcV9HppkoW5gC62FrocVrPDyEPpEdJGbag9WiR+IjMmR31dkwKfOeuB
         yIPZDwGvxv+VgYBpYFNScHQtXt8oJ7ARz68MUcy6EzUHfSF4XjGZgAj42elB1ysC0pXf
         g+z4xrBv4gTH5uAUbxMTPK8DHOeI81ODcvcl9mSD4kdJ2z+eJ2yOi8Lsk3dx5JpO5ePN
         B7LrYBgSBr8pVtGodPWcKjgcaUzEKC5ju5XUGDmDfkbv0oYRjZUrcFxfJnGUAfbmAeQC
         T1BxNPTWdSzCa8RvtU3xdAj8zh8eHSlEfl79sFIlrUPZkljqqOB55mCUy4ZVYoe5EZYc
         q+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rfmOlZ8jir+EAMqX4PnVHLabHxKtr2ch7udqzGjAVnQ=;
        b=pYquA4X6pMdSdm4TS5Nzlzr3XmJDgMSYCE5y2grseeIMXtAJb9OD/nM20PZ5GAT4rP
         bPm3rAx3dhp9XUwgGAcAum/Qus73AJrCLlS9uQqW/CNTtifMOd6Oe6C/18chNwd6wNbV
         mbh8Aqjcy7ZejplnOlhFrkRremhf2a/FI0mvLb0X3Q5gstu7mDThV0GQxJMxYd6bnLVL
         xrpJeh07KvYD8+ljTsnMhS+ssZFj05qycz3RjOryQSU6Cw/r7mCuX/2fA1gyZ/g3gJL+
         rTkD5fDTTCEMrNqrXtbThLcrg/8HQDTIGj3tdxC7lTWUGtT/zGvPtYLbwWQgmtns8fX9
         vJ2Q==
X-Gm-Message-State: APjAAAUyvU2ln4zavk5mGY3MIbdyDXI8FTDFvqe9f8/qtZfMiJQOHoeK
	fY447Ojq1tIwEuJosjqWkeY=
X-Google-Smtp-Source: APXvYqwMQpT/ABHJCQIzvCwn0tUduk7w2MnySm2scHyTbehiAxzP7Bd3wfwraLW90+yLRbU+UoN6Jw==
X-Received: by 2002:a17:902:74c5:: with SMTP id f5mr100326788plt.229.1578305496707;
        Mon, 06 Jan 2020 02:11:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:fe5:: with SMTP id 92ls7296072pjz.5.canary-gmail;
 Mon, 06 Jan 2020 02:11:36 -0800 (PST)
X-Received: by 2002:a17:902:bd06:: with SMTP id p6mr66004029pls.27.1578305496149;
        Mon, 06 Jan 2020 02:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578305496; cv=none;
        d=google.com; s=arc-20160816;
        b=02+19Ev1H+r7VD6fD20urFLzpls75+lbLwbr6+FUWcm803rUyXgfVg50cyRcWHpxfY
         xQyVK3+QOu1iss0y0uLg9NiKdg0sZPzdOmsE/qa1bIw0NGmb1kZDerJu3mAgLP6pECpi
         QWcaIOlObtAo2n8BCZoIY5Ogs0WfElFeDP0bERrVLolehvmil2JDC+CSA9T6cMYxLEYk
         VDL0PMN2YmbMCyp6mfqff8O/VT6Rc5GtsXoGDoJkJ+h6L9xu6rN5ih9XURSOauRm2H79
         AuHA+AvuPH5MAbx+sG1ohfHdQXFCW3WOLUKJ38cwBS3U0bBV2yE2wkr0OQB7M8sTXFkW
         KEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:dkim-signature;
        bh=Z5SSlnGmsxXBUjaKqpA19RUdXbWxYrkvVb5xkHL5VuE=;
        b=iP4PCoTO8w/q+F1qlcpn6lImJC8uYdT0qEsA/s5L9COd8twk8IdjUnMvIDGuPiXTe4
         nohxYmVVkAEN774Y9BSosbtiEwPjEgD8rbHU43ZNri7kW8LcsTtp0rp4QfR0BMZcNLxk
         8fEqcyb6xWCT01hvJXKAQ2m3tBCHVikNKtGtH6YXczB4h6uPBluY57ICPgToCVuyyXe4
         5xwBsRplrbpoh0fqW/rD/n9PJGclFkJMjE1LuvpKBK6UcbxpgJpYqPWQWf+jeOGI8+IT
         9l72vsqtpssuFtV/rmeLWi2ldWobGRFxTxe6QcuaLsyq4ZBxmcObDu8aodx1QYLwaebf
         zYtQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mZf+PCS1;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id c6si764604pjq.2.2020.01.06.02.11.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 02:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 006ABZYd015272;
	Mon, 6 Jan 2020 04:11:35 -0600
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 006ABZXE091887
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2020 04:11:35 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Jan
 2020 04:11:34 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Jan 2020 04:11:34 -0600
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 006ABWPY052078;
	Mon, 6 Jan 2020 04:11:33 -0600
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
 <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
 <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <dbfd8b59-103e-2dfd-03dc-6a35559da69f@ti.com>
Date: Mon, 6 Jan 2020 15:40:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
Content-Type: multipart/alternative;
	boundary="------------DB03F8DE47ADF2429E79F38C"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=mZf+PCS1;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------DB03F8DE47ADF2429E79F38C
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 06/01/20 2:52 pm, Jan Kiszka wrote:
> On 06.01.20 09:12, Nikhil Devshatwar wrote:
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>>>
>>> Huh!? But this breaks cell create/destroy cycles, without any user
>>> notice, no? And will root cell devices keep access to inmate memory=20
>>> that
>>> is carved out during cell creation?
>>>
>>> Is that a hardware limitation?
>>>
>>> Looks like a blocker...
>> Yes, this is a hardware limitation. I it designed for static=20
>> partitioning.
>
> IOW, we can also not change the configuration by destroying and
> recreating non-root cells with different memory layouts?
>

For now, we have gic-demo, uart-demo and linux-demo
You can interchangeably create/destroy cells in any order.

>> Although, I made sure to not break memory isolatio with the following
>> workaround:
>>
>> When booting a root cell for Jailhouse, you would typically carveout
>> memory for the
>> inmate cell. I have defined the cell configs such that, in the root cell
>> config, RAM region for inmate is
>> NOT marked with MEM_DMA, this way it never gets mapped in PVU.
>>
>> When creating cell, root cell maps the inmate RAM loadable region, here
>> that memory is not
>> mapped in IO space.
>> ---> Limitation of this is that you cannot DMA copy the images in the
>> loadable sections,
>> =C2=A0=C2=A0=C2=A0 which we are not doing anyways
>>
>> When destroying the cell, Jailhouse should map the memory back to the
>> root cell.
>> Here, again, the inmate RAM region gets ignored in IO mapping because of
>> lacking flag MEM_DMA
>>
>> cell_create=C2=A0 and cell_destroy work in regression, tested successful=
ly.
>>
>
> Please add at least a test to the unmap function that warns when a
> config is violating the hardware constraints. It's still not clear to
> me, though, how well that goes with changing inmate cell configs.
>
Let me explain via the code

root cell config for j721e-evm:

1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D 0=
x80000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0=
x80000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x80000=
000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_LOADABLE,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D 0=
x880000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0=
x880000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x1fa00=
000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_LOADABLE,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshmem and ba=
remetal apps */ {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D 0=
x89fe00000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0=
x89fe00000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x20000=
0,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate */ {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D 0=
x8a0000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0=
x8a0000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x60000=
000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },

Here, note that all of 1,2,34 gets mapped in CPU MMU, but only 1,2 gets=20
mapped in PVU

inmate cell config for j721e-evm-linux-demo:

5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =3D 0=
x8a0000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =3D 0=
x8a0000000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x60000=
000,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAILHO=
USE_MEM_READ | JAILHOUSE_MEM_WRITE |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 JAILHOUSE_MEM_LOADABLE,
 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },


* When enabling jailhouse:
 =C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as 5) should be=
 mapped in=20
CPU MMU and PVU
 =C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped. root cell ke=
rnel=20
continues without any trouble
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate memory is rese=
rved, no driver attempts DMA to=20
that region, no faults seen

* When creating inmate cell:
 =C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU should be remov=
ed from root=20
cell stream ID and to be added in the inmate cell stream ID
 =C2=A0=C2=A0=C2=A0 With current config, unmap return 0 because nothing was=
 ever mapped

* When loading images (SET_LOADABLE):
 =C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be mapped in th=
e PVU map=20
for root cell streamID
 =C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit skips this chunk=
 and never=20
maps to root cell
 =C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cell view of inm=
ate loadable=20
memory, there will be faults
 =C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we CPU copy the =
images)=20
Correct me if I am wrong here

* When starting cell
 =C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be removed from root =
cell and=20
added to inmate cell
 =C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapped
 =C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate 2nd time doe=
s nothing if=20
the pvu_tlb_is_enabled returns true

Nowhere, PVU unit reprograms the memory map to add or remove entires.=20
Because it doesn't have to do.

Sure, there are some limitations of this appoach:
* DMA copy of boot images not supported
* Root cell memory map should be split to mark all inmate used RAM=20
regions without MEM_DMA flag.

Regards,
Nikhil D

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dbfd8b59-103e-2dfd-03dc-6a35559da69f%40ti.com.

--------------DB03F8DE47ADF2429E79F38C
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 06/01/20 2:52 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de">On 06.01.20
      09:12, Nikhil Devshatwar wrote:
      <br>
      <blockquote type=3D"cite">
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">+{
            <br>
            +=C2=A0=C2=A0=C2=A0 /*
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
            <br>
            +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
            <br>
          </blockquote>
          <br>
          Huh!? But this breaks cell create/destroy cycles, without any
          user
          <br>
          notice, no? And will root cell devices keep access to inmate
          memory that
          <br>
          is carved out during cell creation?
          <br>
          <br>
          Is that a hardware limitation?
          <br>
          <br>
          Looks like a blocker...
          <br>
        </blockquote>
        Yes, this is a hardware limitation. I it designed for static
        partitioning.
        <br>
      </blockquote>
      <br>
      IOW, we can also not change the configuration by destroying and
      <br>
      recreating non-root cells with different memory layouts?
      <br>
      <br>
    </blockquote>
    <br>
    For now, we have gic-demo, uart-demo and linux-demo<br>
    You can interchangeably create/destroy cells in any order.<br>
    <br>
    <blockquote type=3D"cite"
      cite=3D"mid:7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de">
      <blockquote type=3D"cite">Although, I made sure to not break memory
        isolatio with the following
        <br>
        workaround:
        <br>
        <br>
        When booting a root cell for Jailhouse, you would typically
        carveout
        <br>
        memory for the
        <br>
        inmate cell. I have defined the cell configs such that, in the
        root cell
        <br>
        config, RAM region for inmate is
        <br>
        NOT marked with MEM_DMA, this way it never gets mapped in PVU.
        <br>
        <br>
        When creating cell, root cell maps the inmate RAM loadable
        region, here
        <br>
        that memory is not
        <br>
        mapped in IO space.
        <br>
        ---&gt; Limitation of this is that you cannot DMA copy the
        images in the
        <br>
        loadable sections,
        <br>
        =C2=A0=C2=A0=C2=A0 which we are not doing anyways
        <br>
        <br>
        When destroying the cell, Jailhouse should map the memory back
        to the
        <br>
        root cell.
        <br>
        Here, again, the inmate RAM region gets ignored in IO mapping
        because of
        <br>
        lacking flag MEM_DMA
        <br>
        <br>
        cell_create=C2=A0 and cell_destroy work in regression, tested
        successfully.
        <br>
        <br>
      </blockquote>
      <br>
      Please add at least a test to the unmap function that warns when a
      <br>
      config is violating the hardware constraints. It's still not clear
      to
      <br>
      me, though, how well that goes with changing inmate cell configs.
      <br>
      <br>
    </blockquote>
    Let me explain via the code<br>
    <br>
    root cell config for j721e-evm:<br>
    <br>
    1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x80000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x80000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x80=
000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_LOADABLE,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },<br>
    2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x880000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x880000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x1f=
a00000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_LOADABLE,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },<br>
    3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshmem an=
d baremetal apps */ {<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x89fe00000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x89fe00000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x20=
0000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },<br>
    4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate */ =
{<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x8a0000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x8a0000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x60=
000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },<br>
    <br>
    Here, note that all of 1,2,34 gets mapped in CPU MMU, but only 1,2
    gets mapped in PVU<br>
    <br>
    inmate cell config for j721e-evm-linux-demo:<br>
    <br>
    5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_start =
=3D 0x8a0000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_start =
=3D 0x8a0000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =3D 0x60=
000000,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =3D JAI=
LHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=
=C2=A0 JAILHOUSE_MEM_LOADABLE,<br>
    =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },<br>
    <br>
    <br>
    * When enabling jailhouse:<br>
    =C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as 5) should=
 be mapped
    in CPU MMU and PVU<br>
    =C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped. root cell=
 kernel
    continues without any trouble<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate memory is r=
eserved, no driver attempts DMA
    to that region, no faults seen<br>
    <br>
    * When creating inmate cell:<br>
    =C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU should be re=
moved from
    root cell stream ID and to be added in the inmate cell stream ID<br>
    =C2=A0=C2=A0=C2=A0 With current config, unmap return 0 because nothing =
was ever
    mapped<br>
    <br>
    * When loading images (SET_LOADABLE):<br>
    =C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be mapped in=
 the PVU map
    for root cell streamID<br>
    =C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit skips this ch=
unk and
    never maps to root cell<br>
    =C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cell view of =
inmate
    loadable memory, there will be faults<br>
    =C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we CPU copy t=
he images)
    Correct me if I am wrong here<br>
    <br>
    * When starting cell<br>
    =C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be removed from ro=
ot cell and
    added to inmate cell<br>
    =C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapped<br>
    =C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate 2nd time =
does nothing
    if the pvu_tlb_is_enabled returns true<br>
    <br>
    Nowhere, PVU unit reprograms the memory map to add or remove
    entires. Because it doesn't have to do.<br>
    <br>
    Sure, there are some limitations of this appoach:<br>
    * DMA copy of boot images not supported<br>
    * Root cell memory map should be split to mark all inmate used RAM
    regions without MEM_DMA flag.<br>
    <br>
    Regards,<br>
    Nikhil D<br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/dbfd8b59-103e-2dfd-03dc-6a35559da69f%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/dbfd8b59-103e-2dfd-03dc-6a35559da69f%40ti.com</a>.<br />

--------------DB03F8DE47ADF2429E79F38C--
