Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBVG4ZPYQKGQEVDR4OVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C94F014DD60
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 15:55:16 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id s25sf1519617wmj.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 06:55:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580396116; cv=pass;
        d=google.com; s=arc-20160816;
        b=eLf3vN+UT1UFvaPcrBtiAVsUPjJH2nUvEKbbSOxtrS14mDUAZ5wadm8uANeURfOBz5
         OmMSY7TXJ+FhiH89WuDpnkG43A97x00pAWh6GdK1kBHde/SHN3//L3Kf9OQoLtNu3BYV
         ifLxZ3/mQ2wR4HktAve1SrXCxPECGoR7Q8P+OMGLpQL8NEf/yVJvzo+73SB5haiGAELP
         DO7kz9nIg90aV8elgUT9L0CL+b2R8KXx+NhVMvS26bp4QEgsN6L1h+lON+8gRWEqSr+/
         KvWs03nUMRHnsmojxJ7Fpz9EOrcn8oxl5k9JXHBNwvRPYIwa6naogSj1ghQjTEgx1Ouk
         wgFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=QI+jcrFUY0QwhbWnC9MrYNacWOVBMkC10kmAejb/dSk=;
        b=aH1SmKIza9dmxBoSO/KouuMRKmnXfWrXloB+pG0xGJVyUO6aW2QG5TORhqtQwM0e6r
         /QoN/irfzWEilsnn5jVXJVkjke6TUMRNUAw8EqT8adTHhd0KiG6TBNSUzvEE4Ci/ACMI
         SK15gWWjj9tXNJhyvYp38OoVLurPan5kolvyhduTZAlipAllwn2pKQ5UsLT0AH3jfrxg
         UnOpK33tNHId06XwPNmWpxSTnd86g+v9SwgfMYBeg4ozxj44OSD/WZrZF9xIIEjgNsHT
         RFImLO9fN+gWb/dDeuE6Ztp7+HbUlDKyOziELDWLmk41J13lILQ2HAAMO8Ip8Nb2We6v
         BBww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QI+jcrFUY0QwhbWnC9MrYNacWOVBMkC10kmAejb/dSk=;
        b=LDuEV4CO+chF/wpzFfHaNgPxgJTD+qpHytBhSliHW999POIEkQQDqacTNuj4h0P3/6
         1UcqdCi17Qmy2Iz/zx1NuS8r2xF4ulSkGbJ+oK3cXgxMqxP54FecVqejc9dPpOQJrQQ7
         gSw9MMw0CTaZnAGMf7Rwft9Ej669g0PEnHuKqdnbuzdppgn/86xUqfNMzU82AudeE8wi
         lltZ76yEmWh5ZESwf9sSU6BXN1bhc4E1omDKMJY2eUWJ+3AOjz4c9VtdBwxEWBb+e6uG
         XYvO9Hcwoi7YfT4m+inAwcBiP9gE37KRoQVzh3atxgBRVSXFhXwvXBT+1JJLBgJweHcv
         HcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QI+jcrFUY0QwhbWnC9MrYNacWOVBMkC10kmAejb/dSk=;
        b=Kt1ZKyuB1wNJr4eiJkYa6912UYurKWP7R5jah/cVU5QtdMlEKzGiuzXmZoW6xHmwCp
         BhBQbrJkttBNb4oUpjgMCHLt4cQ5Whn1LKa6oZnXlLVTR3F4x2fS4IJnScgQvCQ1xGlL
         OI2GWlBGp2r70d4v+XTVGc3YTyUtv2nfsFdtjt7oRJT+3vcJ7tzFEtT5GMVoXHwdsP/5
         KHoKQ5HoCj9z6YywSpVk/TQ/eHvJOswpgs5s+p+qUEGT6BdMTSn3f6A630w4hbjX4on3
         wAD84xjbJioc7kKipiKjsNV9U27vwEIAGAx71NPeyLdJLkT7K0E6fYxXxxozdypighno
         yZbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVpTTMNnkFLJ9ov5zRXnyH/pt5yQX6HOloz58/jsEsYMZKc25hX
	8o+n+YOa42eTYsmzGYQYJp8=
X-Google-Smtp-Source: APXvYqxm7P8jrmlTI8GMfPqnqglJHY6ORe3jS3q5vn1At85pam6EheW9LPu4vWAUgCRHeoKAgkJK7w==
X-Received: by 2002:a5d:4b47:: with SMTP id w7mr6539923wrs.276.1580396116579;
        Thu, 30 Jan 2020 06:55:16 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cf15:: with SMTP id l21ls2612483wmg.0.canary-gmail; Thu,
 30 Jan 2020 06:55:15 -0800 (PST)
X-Received: by 2002:a1c:1d1:: with SMTP id 200mr6206798wmb.181.1580396115782;
        Thu, 30 Jan 2020 06:55:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580396115; cv=none;
        d=google.com; s=arc-20160816;
        b=SIF6MHb/PlZiUkuQXVtG6A6rzX7Et9bzs+kzrw8jAcb1+oqy6Y7z+wgcXCfhLIzd3F
         YBdTIzdAesa/7LIKXV+bRVZW7hF8FOrQCzZ8NQaP76myiUvmG86SUuHu79XTsJouQdEv
         bFFn336Fp70fXnnyIyKXUD3G+OKvQtdLIV4iwqw3VeCmHEQhmqVHUzh4tfAo6C6vNdJ0
         2Xqy7mrMGBn/ti5EhC8jdlJXWlUExdAeomB1tLgggzaz16YR4yzQTO7Z9kjCn4YGIkBy
         57hdk8mD3ecqX1kPbVPnsssscdeU7zIb6zJciHJtnLKNFrjmrlmD4lCu1XliEtfSJlqr
         an+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=vO5zV2zoXVujYZR0X0wq3ibxliftMgWMw/WJL8Z5yB0=;
        b=wkb8R9Y/uxjmf8dWJWnnPXfxoUML1POm5wHkSXuhd98uBLx4uTw3hIvAaLeocLMvE5
         UmIGbFADiJuckkzQdxiZqj4IRDLPKZzq8nBd2YeSnubDs65AHvSVNJ2w27L3GJnEEoRu
         4KeVhIwEfh5Jc1vH6CNOIbIdQgO/cACxM7WaWtUrPiL8C2cevhFeL2yuAO+zo7qHxHJL
         1zkxVxfdqDhthZieXk3fhncLarscLH5Brlzy/UPujUrc8l75nWniKnUni1nCDJgkyE4r
         j60uPPcYLckCbuh85moCQ42m7mCIt7pbQW0xu4wpzZ19L9Tr35lSxn+b/tmePvq9Wukp
         Pgqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id p23si281651wma.1.2020.01.30.06.55.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 06:55:15 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 00UEtFqr026812
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jan 2020 15:55:15 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00UEtA4b025597;
	Thu, 30 Jan 2020 15:55:10 +0100
Subject: Re: Query on RAM regions in linux demo
From: Jan Kiszka <jan.kiszka@siemens.com>
To: vijai kumar <vijaikumar.kanagarajan@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <001789de-def6-48a6-992a-bfcdf07c756e@googlegroups.com>
 <f5236c19-ece5-dbc8-e52a-4a6a9408eb65@siemens.com>
Message-ID: <0fc83e67-fe60-9a03-a222-a99f0e5ef308@siemens.com>
Date: Thu, 30 Jan 2020 15:55:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <f5236c19-ece5-dbc8-e52a-4a6a9408eb65@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 30.01.20 15:50, Jan Kiszka wrote:
> On 30.01.20 11:52, vijai kumar wrote:
>> Hi All,
>>
>> I see that there are two RAM regions defined in ARM linux demos. One=20
>> mapped to virtual address 0 and the other 1:1.
>>
>> I am not sure what the first region is for. Can anyone please help me=20
>> understand that?
>>
>> For Example in qemu-arm64-linux-demo.c
>>
>> I am not sure what the below region is for.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 /* RAM */ {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
hys_start =3D 0x7f900000,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .v=
irt_start =3D 0,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .s=
ize =3D 0x10000,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .f=
lags =3D JAILHOUSE_MEM_READ |=20
>> JAILHOUSE_MEM_WRITE |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE |=20
>> JAILHOUSE_MEM_LOADABLE,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 },
>>
>> Thanks,
>> Vijai Kumar K
>>
> That first region is for bootstrapping. "jailhouse cell linux" loads=20
> linux-loader.bin at address 0 in the cell because that is the default=20
> start address of cell cores. The loader performs a few additional=20
> initializations and then jumps to the kernel start address that is=20
> located in the second, larger region.
>=20
> HTH,
> Jan
>=20

Oh, and that 1:1 mapping for the second region is needed for systems=20
that do not have an SMMU (quite a few) or where we lack the driver=20
upstream (SMMUv2).

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
jailhouse-dev/0fc83e67-fe60-9a03-a222-a99f0e5ef308%40siemens.com.
