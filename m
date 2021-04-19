Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBQ6Q62BQMGQEIXWSRPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 9161C36478F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 17:56:52 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id j4-20020adfe5040000b0290102bb319b87sf9267097wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 08:56:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618847812; cv=pass;
        d=google.com; s=arc-20160816;
        b=JNjBdO3TE0ABUuh9FurjQvL0gpKm2elEviL3ETWHCkQ13j6hw45fxtLHKSIrQAB+qX
         7xkLJoZHEMOoifXxAulxNzjTRr1juSB+VidOnMdopIwKIoiKbD8I8+tK2H+CC1o8SOHj
         1ogy7MhLkRs/iYaIMhYcnBKE8zXR/dWQWA4xabIe6zHeslclB3aSrbirJ76YIFTzOz22
         TX7xJj/0suZ/4m6FQJ41vHYL9z39TqagK9hgRhlyHrhFfLfcc/eBSZ4KAWX3ly2Kr7JG
         CyNHRmkKtGNUSyMT6F+36LWi2rxEWGw/qMW8NP1M6Ny/n1e/jlVetRY7qeIDkHnG61HC
         Re+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=uB/D3g1GVZkE83DryGdpcQwAJcM4IL0DSstdco12NFs=;
        b=ffJNniAI64VsdS1zOk4geq+7eCZ+oQ7XGG1db7GOd8dF71wuSrCjyhB85JZUaqC+Sy
         souNy/KkhOp2BoSOLBJf/dHZooXHY5YTJySo0sfVV7YLxO2Or2O0OSNQT87qi8jVpceJ
         MOk4lvAuRwCMQe68fixu6/bexPyeKEWnLlHVIP46HAlSwQy+MbRkj1OfGG6faA7F4GHc
         odmYQmMkstfgfNv/wI7dKDUYxhOLvY7ONM9+yXogS3S1rdIrkqWSEHnT7TfCasnw7Kld
         5F/LpAcY17VCAwlfJyxB+xD7oGAbplqWy0M9iEfA6CeBUqN+ZP4Qtaacg3JCvN5v1gAa
         A6IA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OgPcjJwL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uB/D3g1GVZkE83DryGdpcQwAJcM4IL0DSstdco12NFs=;
        b=U66LxGO6Zl5Lh3n/nFsiorRIpj+3arX0t0aKGb0QSsB1EoX2b71ZT8dow8xPusjRsO
         zVSOy2MKXMAUDPOOJrTnq9pszLEaYBiSF019qVMJj6AiVuxFdpWHwV0E+XSg0Bcspi5r
         FRdl4fg3c0ejOSzOiijDzbkA1XPHdpr4n0K7vmT0h97CVqyMtRhGXYmXBrVp/0ROo51C
         3OPBHgymjM5JYHdlRwDPonaMb1Egm6JFc650Mom9f6vLsW94XHB59qqOXyI8h8tP2ey/
         aupAEbDeli1jgPn4bWPunFQ6sWUaxCfUOTGdsv0rgSnDclRTawO8GYohu4D+BuBnl/BB
         fzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=uB/D3g1GVZkE83DryGdpcQwAJcM4IL0DSstdco12NFs=;
        b=sImj/bbBWQu/FJ9RR4t3JK6jsmSavcSuXsoDu3plInwtA9CLxqrzUTCRpGXveH6rTI
         oJM38yNssaxzdg7Bc8MT8MGycBLL99jrYwidBmv6LPrX/Ghd6BLmOCvuXvzGDtPEQffo
         n8t0Y5Tx2txxbB8415NLFQSrl0aW7Yb30Tw35g+wys+O3LyVoNAi2nSgNv2Zcc+DC6ZV
         HC0SnU4koZT+x7x8Ow3CPU4J34NjUgsugeISsdZrbeUDc62KTr4JFu8hjejMGNQWIxjj
         vmhE+ivlSigHyPeKgF+7BkWpSiPr0LJA63VdmI0wYGzcZQAzYH4x3RCeCH0CCOYpRwLu
         +e4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533yHmmCq1XQozete2iBbfdDhFHa+P0x7xNgRm8A6nlvzJ4jL8re
	k/xduYcJVGV2/eA2LBLIZcc=
X-Google-Smtp-Source: ABdhPJxh3jUbSX2e3tDWgcjnRGVZ+kjTzz4/H7NmlM36jN8QA+qWzJhjWQlFXa1obTrcXdeXDsd/jQ==
X-Received: by 2002:a5d:6a04:: with SMTP id m4mr15126238wru.421.1618847812341;
        Mon, 19 Apr 2021 08:56:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d1e5:: with SMTP id g5ls8421245wrd.1.gmail; Mon, 19 Apr
 2021 08:56:51 -0700 (PDT)
X-Received: by 2002:a5d:650d:: with SMTP id x13mr15344232wru.264.1618847811252;
        Mon, 19 Apr 2021 08:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618847811; cv=none;
        d=google.com; s=arc-20160816;
        b=XVtPQhGWGDlAsYZ1fiS7WloGh0vx+fCUDpLPF8h1b9smHkoGOykdbyTFibW8Jp9CWQ
         bHkfolol/txVQMAJ1gp9jH7daL4s+/e8oYWRtD8u7Xz1CDmKlpZPyK10bXsKuBUbnim1
         smJjBHP78hIdJ0tzsg/El4TjPm2LsdlJQt9szSrcYhAyae12MFylnLfNnBL3sn0kmhh/
         9SZeNWyiZWVl16VHhVJTzHUwwXRTZRCFH/5YsM3KTSxNgDzjjkDhJW+Db5xnjswAZpcC
         Tmn1//WOwFlKTxHfPA1gObdGM5sHXvGNoh6Jz9iiHG37n2DMO3g6PPz/DuEIkfO0qTzI
         VipQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=nRO/O5mq7CK5M4emUuciUKCokJIV8hrEtqosy7F6AuM=;
        b=zb+akvyHkru3+prVMD4wKUrqlLLtPi2HGcmGSSFEVvaWkycXS0uWqrvNi7QYA6l72B
         GsMYdp0aEASwt2jrnCAxX4VZ3VGpUK1vxA3CVJSnv2FkLsJUgmI7txaE5FnKoqQ5c/rB
         IEQuJqkxzJO76ChU9xp2nrjrPfbEg0gzMdIu6J3RCrCziWVZbXtMgL1+mw2TbKNkBv39
         WCEK6Fgwqk95vlxzd3sF15BYMthVosBVJpGUpjpzWBrk8JdpSs3qQvYGaVZ6ZUg9WsaW
         7aO3S8ydt13XxDzoFa+pkL3t3OxxO2SR9owmAWo0JMqHWjUXeuxJhx5O/XsBv0U9s/DE
         DtTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OgPcjJwL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id y16si894218wrh.3.2021.04.19.08.56.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 08:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FPBJf6TkQzxyt;
	Mon, 19 Apr 2021 17:56:50 +0200 (CEST)
Received: from [172.16.2.102] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 19 Apr
 2021 17:56:50 +0200
Subject: Re: [PATCH 1/1] x86/mem.c: Fix allocation bug
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Jan Kiszka <jan.kiszka@siemens.com>
References: <AS8PR02MB6663B55522C63851C338E6A8B6499@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <08a134a0-778b-6b78-1b24-9214ecde5f3b@oth-regensburg.de>
Message-ID: <31b95b80-a2da-09cc-a6bc-a89f51bb0a1e@oth-regensburg.de>
Date: Mon, 19 Apr 2021 17:56:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <08a134a0-778b-6b78-1b24-9214ecde5f3b@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=OgPcjJwL;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 19/04/2021 17:37, Ralf Ramsauer wrote:
> Hi Bram,
>=20
> On 19/04/2021 14:17, Bram Hooimeijer wrote:
>> When creating a new page table, the table should be filled with zeroes
>> to prevent decoding invalid entries as valid in the future. Given that
>> in the inmate memory space no assumptions can be made on the contents of
>> unallocated heapspace, zeroing needs to be done explicitly.
>=20
> Don't we already zero pages when reloading a guest? (I'm not sure)
> IOW: Did you really experience dirty pages?

Just cross-checked: Looks like we don't zero inmate memory on cell
reload. Now I wonder why I never experienced a similar bug=E2=80=A6 But we
haven't many inmates that make excessive use of the heap.

>=20
> Anyway, if we don't, then we should think if we should zero them. The
> question is, if it is acceptable to leave artefacts of previously
> running inmates in memory.

I think we should rather implement a zalloc() wrapper around alloc(),
which gives us guarantees to return zeroed pages. We have some other
spots in libinmate where we could substitute alloc/memset-sequences in
libinmate, e.g. in lib/arm-common/mem.c and lib/x86/smp.c.

  Ralf

>=20
> Thanks
>   Ralf
>=20
>>
>> Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.co=
m>
>> ---
>>  inmates/lib/x86/mem.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
>> index 7e1c8b83..45424ea1 100644
>> --- a/inmates/lib/x86/mem.c
>> +++ b/inmates/lib/x86/mem.c
>> @@ -58,6 +58,7 @@ void map_range(void *start, unsigned long size, enum m=
ap_type map_type)
>>  			pt =3D (unsigned long *)(*pt_entry & PAGE_MASK);
>>  		} else {
>>  			pt =3D alloc(PAGE_SIZE, PAGE_SIZE);
>> +			memset(pt, 0, PAGE_SIZE);
>>  			*pt_entry =3D (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>>  		}
>> =20
>> @@ -66,6 +67,7 @@ void map_range(void *start, unsigned long size, enum m=
ap_type map_type)
>>  			pt =3D (unsigned long *)(*pt_entry & PAGE_MASK);
>>  		} else {
>>  			pt =3D alloc(PAGE_SIZE, PAGE_SIZE);
>> +			memset(pt, 0, PAGE_SIZE);
>>  			*pt_entry =3D (unsigned long)pt | PAGE_DEFAULT_FLAGS;
>>  		}
>> =20
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/31b95b80-a2da-09cc-a6bc-a89f51bb0a1e%40oth-regensburg.de.
