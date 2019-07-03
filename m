Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKXG6LUAKGQETSUHQCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 716645E5C7
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 15:52:42 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id y2sf719647wrh.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 06:52:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562161962; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZqXj8Q94wIlISU/+l4tpZmhmhKJIvavfdPsLQBvtw30n98UyyD+ht3s4Y5fFsyrOKc
         RQMvX5zfbAdauMoZQ+67GRdXAELK7U9tnNwSlyM6v1hDfp1UwlsUh71m5yJhf4MoXHQy
         7s7mft0tbj93k04mGmU77RK7ia86FiFkyhPv/0XaQOktgZ3qv1xhVXh2PkFeadsKxvIS
         88j87CpNh8R0QEKDLgPu6zGdKpnoDxxAhMpSne2M/QiHGhRta7bpzjqLdUku8f6nx6lP
         7HGR9IWE3Cy4oEPMHncJM2IcJlnVCX6d4xXei/175wtc08XtDcAPnLC88u247awCNPBJ
         1maQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=bBbu46TAqLhrmDoQdeAnkHRZI45jaiyZCLMT56WZQS4=;
        b=QtkZcUMLn6GtcPFKnGVQrAe9sCx41eaWU9YblKLQOK5aCdi97Gs0N1XMRREMdKmdW3
         6EVTBzdzBmGXHJxMVdQOiWvUs+Yii02loQ6WCWWRfqnWB094u4pZ58zOSquKshr+uzca
         SOSoU14nkVoNfkmmMxRRfuS5BC1liYd2+1YT7VEyCaMI1Cjm2wJcrU/rfKeDRaz7r5HZ
         7mdu1acnfk9V6EF4A004J1jXH6aJrB5Ck02OgUunQqvM2sZMnpUS3vSEZQHQJnfHKGac
         L6sdJAGfYvcXhiid63NWEfArtLO+T+gK3/+0OlHqze11HETDLJcOV9NB6xeDRFA/3SSU
         D1mw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bBbu46TAqLhrmDoQdeAnkHRZI45jaiyZCLMT56WZQS4=;
        b=qYrbo17ov9ouEAzgnTdDQhg0FS1CZBw6QipVWPc41jHdfskqHsbi71PR3EJXBdM5+n
         DN2rITMi+BUkWH5zrvpf2E2EEWKUW/qWsndR59PcGE2WitPBG3049INjbBKRojq3p+88
         hu3ze+kc2EbiBm0pNv64knRecPXnSkR4QTrucsNJSqueqABxXdodL8prmzZ2/k4jkZMb
         WJsMLPvtGWlsLOLDJOYeRWdpCt98QOeD63hzBAGF3JiFgA4cUgf9ghCGkusbn3MmZy5D
         rKk5ogokoyGxj1BVsMXA/7X1jiyaZUDGc0XSSWupO2axs0FDlbWyeTHfLjLVJ9gLRLqs
         v+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bBbu46TAqLhrmDoQdeAnkHRZI45jaiyZCLMT56WZQS4=;
        b=UfWNRH09cnoQNnIyNybX9//6u3DRgyK6wl/T1qWPka/Xpro/mTkNm5gsXumSy9gqrw
         UmjIdoZZPa3mREyJQMrGAW44D94wE2g3yC/cfjAQimi1fd2k1Ot+3qMIZC29tS51id2D
         u3fHzbZPhhUuXiZN4Rpxrb3ju1v23ZQK+YFovO5xvnna8vr4jkngqidAWfmS6K9CRLPV
         SlWNOXDy7mI8nRe7o1dA549qRKOdpKAxtlAMgrLHlb3LBNjOSyppUxurXHjYGoziHS2Y
         k96oZVBO8JRKUcNwFata01Qy6SHHQRg6cwPWq50Zt4y486J0xuOu/nExZaTBMytUbtDQ
         eZdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVnfo+YM9et9ypQcKXSzh5wsFWDimhB6qCNr/wL1YS3UxDwAqk0
	JJvhTG5fMjWTG9HNqOJRRlc=
X-Google-Smtp-Source: APXvYqydDKrLYBvZht/cb56pSn/TT6DWKOQ3EuZJPRjzscTGyHpCCjmeqKteG7OMUXxkuTeL7K2D7g==
X-Received: by 2002:a1c:c255:: with SMTP id s82mr8608550wmf.6.1562161962166;
        Wed, 03 Jul 2019 06:52:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d02:: with SMTP id t2ls742044wmt.0.canary-gmail; Wed,
 03 Jul 2019 06:52:41 -0700 (PDT)
X-Received: by 2002:a7b:cc16:: with SMTP id f22mr8853878wmh.115.1562161961562;
        Wed, 03 Jul 2019 06:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562161961; cv=none;
        d=google.com; s=arc-20160816;
        b=QtGRJVEodio/+97MIzptpRbe4zpRBEZN6c5b+fhrlqJfp9a7KSckClOUM/R6wwidrB
         921nQHH9Y4ilCMjQguyR8Lb0VNnBSfT0jxV8vgZ75dHQ/DQbg/0+ORn/ulnoJSGbY/B3
         iBDp8TzCK1GTv+0HIbsDpXuSvGlgphR7yiuIkWKrdHri7itaOOJhm6jUNeoZQ3kGHy6T
         PRzKMguYEkTn9w/a6JUcLlZEdA+GdNlVxlOL8m5522WeB0z9xp3tOQ7rXAKBxetAekf+
         vRgHJuhUPxs3vrCME00ItE6SNc2IcYCJ+fYOI2RWvb8tJDdjIgTbf8djReh5hpDF5SEi
         1qbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=VK9oWjUTQxwIg0dfysU+SBZ4fZGZK6wu/3JiocsxbMA=;
        b=yMHBsaI/a/UCKG3BwWFIVwzsghjqJq33Ka3XciSaCpxz7grtgJGSGes6912esntI+v
         35qedQS5+XAWj4nbGDoEnrTFU3p1E3JcZFIAPCR2Du5QcXpxPp1IrRgcMyGFiVwey+40
         W2UNIhtowKTWhV5SVAjpWv0JTNsqzxsSF1eoq0aNQuxf0mMNP+ND3crdtRLWSWZwrjCN
         XnoD1zi7uik6iHT6ATW4u06fAWZUyhdwF1+yAHRannr4yK/+eILqI4RTKGXE9Z2SrGik
         QKCbIYMc+IpamukERvFEyWJxkQo9YW84OfeceBnusYp9hGLlFsjHoIvOwQEx/5lBnk7y
         tqwA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id u16si81918wrr.0.2019.07.03.06.52.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 06:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x63DqeEW010594
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Jul 2019 15:52:41 +0200
Received: from [139.23.73.211] ([139.23.73.211])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63DqeG6004662;
	Wed, 3 Jul 2019 15:52:40 +0200
Subject: Re: [PATCH 5/6] core: Move unit initialization after memory
 initialization
To: Pratyush Yadav <p-yadav1@ti.com>, jailhouse-dev@googlegroups.com
Cc: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190702143607.16525-1-p-yadav1@ti.com>
 <20190702143607.16525-6-p-yadav1@ti.com>
 <bd22fee9-f3ee-0585-d98f-a411f8d58f1a@siemens.com>
 <7d39456a-9797-e83c-1cba-63d21b374e51@ti.com>
 <ca098d37-5a46-882b-e295-d8a2cdf093f9@siemens.com>
 <47bf5f44-f36c-1aad-3ff4-d4e315d4c837@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fecc1ce7-1460-deb4-e56b-8316c34b1252@siemens.com>
Date: Wed, 3 Jul 2019 15:52:39 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <47bf5f44-f36c-1aad-3ff4-d4e315d4c837@ti.com>
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

On 03.07.19 15:46, Pratyush Yadav wrote:
>=20
>=20
> On 03/07/19 3:16 PM, Jan Kiszka wrote:
>> On 03.07.19 11:12, Pratyush Yadav wrote:
>>>
>>>
>>> On 02/07/19 9:18 PM, Jan Kiszka wrote:
>>>> On 02.07.19 16:36, Pratyush Yadav wrote:
>>>>> The SMMU driver needs access to guest paging structures, so they need=
 to
>>>>> be initialized before we can initialize the driver.
>>>>
>>>> No signed-off - because you were not sure if this is ready? ;)
>>>
>>> Quite the opposite. I was so sure this simple change was correct, I did=
n't double-check the patch and missed the signed-off.
>>>
>>>> The bad news: it isn't. The x86 IOMMUs have to be initialized prior to=
 calling arch_map_memory_region because that calls iommu_map_memory_region.
>>>>
>>>> Can you describe in more details why the SMMU driver needs that guest =
paging access during init, and why that can't be solved by hooking into ARM=
's arch_map_memory_region?
>>>
>>> SMMU's init doesn't need guest paging access, but arm_smmuv3_cell_init(=
) does. Linux might have already initialised some stream table entries befo=
re Jailhouse was enabled. We need to copy those entries in the hypervisor's=
 stream table. This is done in arm_smmuv3_cell_init(). But for some reason,=
 cell_init() is not called for the root cell. So I call it from arm_smmuv3_=
init().
>>>
>>> This seemed like a simple enough change to work around the problem. Cal=
ling cell_init() from a later point works just as fine. Any particular reas=
on why cell_init() is not called for the root cell? I see a lot of drivers =
(ioapic, vtd, etc) calling it in their init functions.
>>
>> I suppose you mean the cell_init unit callback (cell_init() is called al=
ready during early_init()): That is called on cell_create only. We could al=
so call the cell_init callbacks after unit initialization from init_late(),=
 but that requires some careful checks if there are ordering issue. However=
, that wouldn't solve your issue.
>>
>> But your problem is not that different from vtd.c e.g. It also needs to =
access the guest pages in order to transfer interrupt remapping information=
 into the new IR table. That is done during config_commit, and you should j=
ust do the same.
>=20
> config_commit() is called at both cell init and destroy. I don't see a wa=
y to differentiate between the two. I need it to run only one time when the=
 cell comes up. The cleanup is handled by the unit's cell_exit() callback. =
Any other way to do this?
>=20

Just test on "cell_added_removed =3D=3D &root_cell", like other units do - =
the root=20
cell will never be removed.

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
jailhouse-dev/fecc1ce7-1460-deb4-e56b-8316c34b1252%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
