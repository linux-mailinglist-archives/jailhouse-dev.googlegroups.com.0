Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBREAULUAKGQELSVWJFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id C35A2498C2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Jun 2019 08:10:12 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id r1sf2373797ljd.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 23:10:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560838212; cv=pass;
        d=google.com; s=arc-20160816;
        b=pnBck37tU4kAAg/BhPPHJlW7XBbxQa3xQ7zeUdnSCyKRqh7LJLErQx6ta1PnDbE8Ka
         oUivlDe+oiryet6o/+9dafxMNc24m2VRUuJxtM/mlo2Y9f/20QqMXiAVjxWBEFDz6Anm
         N5rRUfXviqOGQKtPuz1qvatw+tUoHEL11DY/bmc7+ug6bXKQNhWJD8geNbdVwez5OvSS
         YVWIZC76P7LjQ+8FbsyZsE9xQ/tQIZEVXq79ACrRuk4UoYq2Dxt5wiB7PwJ9d2jhpg4T
         AjYw+LTdF7/g8Pa2pIT7pZ69nxG9XuxWqrWkX9s/fMw0/XCGATg8cgOY6PTqPc+E3SBv
         FKVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=YnAKZPnNu2cGLNcqcUGeuKqSFKw53xzE1cKNpIoyiUU=;
        b=jhFDC0kfmBmsvFb+J72J9pVSIQSJPiAaNGK34f8WfeTzXnG2Pkc+cv1cTXrRVGQQua
         JCBiFHJ8ssXehVeyl6SnQxPfnRkUksmj4J+V9YZSc0/8q0fL1xpcj+ipogxL11M/BHNp
         XG/fnVBk8sfyM9+eemQTTyAFJNa/SOadj+xiz+2sU0+b4wGHMXe3MceuQYT1NK2CWk8M
         LYACgVq1gcbICqxWKeUBoYdTu6dG1bkYKefzEWVH3wD9mCd/ShQarUW/ylh/vNULzV7n
         gv+Tv1gQj81FYKGCLAodfYSQJ5e40AKYm699Oy/g2AQ3LqDAduUvBRYWelTolXs02UGe
         v1kg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YnAKZPnNu2cGLNcqcUGeuKqSFKw53xzE1cKNpIoyiUU=;
        b=ZFifnjf8CgMCtD3DP8jIrx8NpGkzXgNAZ6ctm5BBvBg4g/014NeC8SBYVz23aDB03+
         AhZMOJALS2+sR4ftVkhSxgS+QIR1SyJiysZgOlyZh4Lkd2mJj3k8L3P2ps9qH5V+ZlGg
         pkXJRBMKqplzV9xZ7pboo02iumCW+8h/M/Uq4WonR6wKz8x1iY9Igo7xa/6ibyFsNrPl
         2Fv7whYTtjWc7YwTNGOQhyoAx7RENQfLDqcDKkCesrSPwvAtAz89EMe/f9MrYGaRzwiq
         DXLDg1e/bGFZ4//tfpFCRLY5zn7R08E6N0GR2035J/q1kphPyEHQwMBcEUXZOE3vv/kP
         Ui3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YnAKZPnNu2cGLNcqcUGeuKqSFKw53xzE1cKNpIoyiUU=;
        b=NFwydPQGvbjUZDbroWOvzkfssYRZ6yVNow/uRrxIAzWk5X4ZH7z8O36OEW1w9BEroB
         uKUJZSx2ogUQ+I+zkOQqWoEh1TuThtsrXikVas1auH/xGZLc839Mt/DKzHFodWFLCsMZ
         GTJzbC4I90wLKrPDAbgD3V8eqqBXw+GUmDPj1D35vCQytr6GiTgek5Y5VA7ovGPsYoJz
         yVSiZCHsAVfPNkjrEYbw14ntQQmn8G7pQ3YEDSWBCotAVRc/AVthIceIMIU0AIUnHqfZ
         ThyaqYQAEhOpGfjwEBzuCpDWp2F4lg6HXnLrqIX7IFAhfNX4WJqfu5zQt2AqGMs+Xwtb
         oDxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW0Fr0YQz40O7w0Q517PZPshlioaph335iiGEj1QxCMYZ2giAZa
	QXQQNu5aB3iVnn4nfs9tirQ=
X-Google-Smtp-Source: APXvYqxj2M1Hrx97WMt7V2SRCo2cr8gnslwbH1p+D6fcX5B2TvHl7PKGKjBO8NDwNN6FQzLti35xXA==
X-Received: by 2002:a2e:959a:: with SMTP id w26mr15888809ljh.150.1560838212315;
        Mon, 17 Jun 2019 23:10:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:f715:: with SMTP id z21ls1648058lfe.9.gmail; Mon, 17 Jun
 2019 23:10:11 -0700 (PDT)
X-Received: by 2002:a05:6512:144:: with SMTP id m4mr59095872lfo.114.1560838211625;
        Mon, 17 Jun 2019 23:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560838211; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHe1KYPzZWA+Z6cjn/z/qxFpo7d8Cgc5Ruj5NHWwUHaG3ZS0xh3ubl5a7yqVRxQ73P
         BPJtcifrsKG7IrG8yz9dJ52VdHlGtqhk2jCaVMI7xWw0gwlc9BFdAqqAnMTyFfHCUkZr
         hMI1RTl4vd6hyFfNRNWTyuJycbGuiAw6bcbmcpqNN9cDGGJdDBbZXZzJoY6ZLeXMseI0
         BeCvcRfke6++bpnaSAlzYWxyGEL1efjJxWRnpb2SFkdzc2/527g4qJsxGa4tuYOuhZIG
         wWuFeacadziqXMFKO49RLMkbxwWNClUpPXzg8yDmRtrpFtaInywHE6cf9dHQggEBEN6A
         IlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=GJymOf8thiCmYHytqo/GCYtjbzMnITnvASA94vRWDgs=;
        b=mk4hF1N+VYFqMRcqtUjmy56yXMwvjuCtgrz03rYLr11b3GeP0kCik2g3Z5LXqbs33o
         eEFGIvUJ0UGtiOFo6EBPC1q7LE9dJLQbMijsfTSDj2lBoSeSj2a7fLApD0p+uO7fmzwU
         OAHYVQp6h/MAnWODOK/2IiNi+hDh3kBcYrAMQTsy42AIemDICtjBGFa6Bt/4mrC2NOkF
         oU2KAqNTUjbWbmiBJJjL73of8WAtflAQhkuDzsmd0r1eMFueiXKKkmjTntgSL/vPLFon
         mLSa5J+TGOA0t2far5BnvbQXRm8C+Z8EDA7DlGhZ8U9IRar4aWRkdqjpNIbV0+5Jirlb
         YQaw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id c15si531141lfi.5.2019.06.17.23.10.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 23:10:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5I6AAA7021720
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jun 2019 08:10:10 +0200
Received: from [167.87.39.124] ([167.87.39.124])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x5I6A9vr001290;
	Tue, 18 Jun 2019 08:10:10 +0200
Subject: Re: [EXTERNAL] Re: Allocating coherent memory
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
References: <7b93d482-cce6-ffd4-291e-7e372f61cd89@ti.com>
 <cfb2de66-e918-74bf-5de9-cbb3aca5571e@siemens.com>
 <5c8d8dbe-f842-f7d0-fe90-2161f636b07f@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d04a4f50-32ea-daf3-5238-7c416f3c95a9@siemens.com>
Date: Tue, 18 Jun 2019 08:10:09 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <5c8d8dbe-f842-f7d0-fe90-2161f636b07f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 18.06.19 07:48, Pratyush Yadav wrote:
>=20
>=20
> On 17/06/19 10:15 PM, Jan Kiszka wrote:
>> On 17.06.19 16:27, 'Pratyush Yadav' via Jailhouse wrote:
>>> Hi,
>>>
>>> I am writing a driver for a device that accesses some in-memory data st=
ructures. Right now I'm using page_alloc(&mem_pool, ...) to allocate those =
structures, but I suspect this memory is cacheable, and thus updates to the=
 in-memory structures won't necessarily be visible to the device.
>>
>> I suspect you mean you write a driver inside Jailhouse, right? Why is th=
at driver needed in hypervisor space?
>=20
> The driver is for the SMMU (an IOMMU for ARM systems). It is in hyperviso=
r space because the same SMMU can be responsible for multiple cells.

Yes, that makes sense, of course.

>=20
>> Yes, hypervisor memory, including that which comes from page_alloc, is m=
apped cacheable. But why can't you evict the content from cache to RAM when=
 that device should see it? That's how we generally work.
>=20
> That is what I'm doing right now. I call arch_paging_flush_cpu_caches() w=
henever there is any update to those structures. But I thought it would be =
better if the memory was not cacheable to begin with.

No, it's not. It's often slower, specifically if you have a read-modify-wri=
te=20
cycle or need to change multiple words in a cacheline at once. Therefore it=
's=20
not how such drivers are typically written. Just look at Linux. Or at our=
=20
x86/vtd.c, e.g. inv_queue_write().

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d04a4f50-32ea-daf3-5238-7c416f3c95a9%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
