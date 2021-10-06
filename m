Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2N262FAMGQETD27AYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 60755423E4E
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Oct 2021 14:58:18 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id n18-20020adff092000000b001609d9081d4sf1959470wro.18
        for <lists+jailhouse-dev@lfdr.de>; Wed, 06 Oct 2021 05:58:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1633525098; cv=pass;
        d=google.com; s=arc-20160816;
        b=TCvfBKNh6jjiTwrkKWec3ZbwqXbsYZfjVHfD2FHUz6WKJ06Bf6x0bb0tR09e7PcXFY
         nybPcRQPqglhN8tTWq5pz7lpRyOQb6dGSCDAEkJAE/8zNR72mkE8SQ1U4FkiCNQpy+Xu
         cSKZ/LxcTYkHrVBSQnruHREDFe7vPw0wOmoRrnjLEdvU7NSpzIVt/duzLsFPEyeJAIgr
         5RpTFd22K1HEZfKmVR3QmvOaWls/30ZkTR35mUdYDejcFH1iIFCjSWfGGEZ4wqnNgqjA
         kU6pAK9YC5iUFLG/BbkGzaVHVeLFfZMYdEV8UwlvCLrDDhfAW5WuDWbjOfpEWOcDmV0Y
         K9wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=epOZesec61p9EUpxpdNp9m8ZgVte1d65yC/fT3b/zUc=;
        b=wvJ3Zws0g5kpgMhyoG9T+WcUdo7X7eETiarXwH4Bch2+0bZxBRmBqdUrePy+VLE2JE
         3sFOtNuVW/70OuqJmxgcdFPZA7DsT/Cc5sq+jjoaLHuE5jgWvu+VS4SDd9apg1HGPn8y
         dTxNZrCNAHrgQtAPSga9E++JAreP/CzmEWheO9ElsDXPNEoJ9gZH7TX5kVRDaGZPERqq
         9oUj6JKaUaqFLg+PaVpdbyIFy4pq69/wHJpSLVcnEMDJy3J284Qg0T4+t3QgLL4RvXmb
         UV+2sXszEIONrFyiu164pMycxi9DknPIzwIBgM6XelHKfuNK8zZW+pw3c0NSR0rFvDmN
         mSxQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GYs0cOub;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=epOZesec61p9EUpxpdNp9m8ZgVte1d65yC/fT3b/zUc=;
        b=mtUlnjnBPSqT7mE2GQVT5+P/DqWKTyG1Jg4F+CZjt1A6oz6fAgJFwtmQ3iBBaw4liw
         YGYqenVSMFPa0KzUlAiQolh4Uky4RGcZgTsiQg9rfzjPfj/F4yh18PLwemRidU5anQiI
         zXiK1lNMWiFxZv1pHPsjynUqoTDFk3ZxCTMepNexn3KQ23wCyLAFLKNNYp1O2+8xbR2A
         z6/TBqAvzUaRq5Fz6Rd8rex2o0DaS3c+tOJ1IcXCe0mJ6/YWt6aA5/CnVtpKdJQiMfJn
         Mz8SC1npHIMCQr5MiYznFEHCioV7ahP1JgynS/PuO9CwP1W4Jj5wI/9JU1Djo5X+qcPN
         SiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=epOZesec61p9EUpxpdNp9m8ZgVte1d65yC/fT3b/zUc=;
        b=w4DMzqnS//WXFokQkPQj4axAMbJQBs0dIn1bLQ1/LWi1fFSvwOpTcqoiG8tRh6PdX7
         f+aX4HRaPunJo9nOayVPfwTTPGgwa1wZPWoFTVwLEIUQMqujTw79AJT/UL9m/f4zaOEX
         Wrd2O0UBOvZuVWj+k3twatIxEYrVrX+hILpxRz5IVmGCIpMT23o1JxKV5FQP4EN3f+Ys
         6bdLQUrNy7DDJy8HthSWFuHZkBWVs0UOg7KTvsMJB3K/0dc5a146Vx7rmAAwKvBBU0m+
         DhFxreOlWhrVYFyudb76lrohabd6GAhpx4dGU6JDtA/jYHpqw2+3LadFkDsEXNyOif3t
         T7eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Ua1C0/HB7LHgbqSMoLM9/nUJDHEjfV1fK4AfLCFgSMtg4G0pS
	AGaeshf4YY5Rf7y7EqlLDfE=
X-Google-Smtp-Source: ABdhPJx4vfm3wB3xXSHfb7L6wMemorVRdu103rjRgPkfIhD/t+qyZA0tFrsRWoyS4PzqSscSc1YSoA==
X-Received: by 2002:a1c:7704:: with SMTP id t4mr9772231wmi.167.1633525098130;
        Wed, 06 Oct 2021 05:58:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2051:: with SMTP id g78ls338527wmg.0.canary-gmail; Wed,
 06 Oct 2021 05:58:17 -0700 (PDT)
X-Received: by 2002:a1c:158:: with SMTP id 85mr9527187wmb.187.1633525097021;
        Wed, 06 Oct 2021 05:58:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633525097; cv=none;
        d=google.com; s=arc-20160816;
        b=pIL4V0N3xNRIS4wjrh63T7MKfwPZ97ysc6qewBf3QZzVcmcr4ruVVDHUH7BuxKmOsl
         EAlphx1MBGXiH99KU4qMGk3w+dytEraHKXHdscCeYaE8PXQiMc9ncQA0zRy1T2VlrfcX
         IgqL6ACdnJWC8wMIKSMGWH7uP5KlNxNNMNSudSHG3GETz/3BXcoUS1O8ac6hkEjAqE8J
         FXw1HK6d5FaekVSFQnucVEYLKSVUikkSQjUJG5Gx+UUFklDoHn2q31t86KyGFu/DDC3k
         uuG0YWo7RhGt/XLTFW/KPOhviAOvup/ScjU5pA8+8W8L6THiYEH83TV7ZjBv94yMoSW5
         eAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EdU1XYGFu0VxIT9pa2o4j44jNuYua0z6epl8djnQcF8=;
        b=uA9Ga2TS+FZJa2sbS/eX4MHKngBcLNNHWfm6ZHIivhnjCd3CyqhyRyfEt1Reo6kuT4
         ivy/0kCGd+c4msjBBqXuE6aUlJ0RoPYtWOA07fMaAwhMpH4kIiZPeU/VyWNTlg1vcFqT
         GD8sHPnjgMhRjeA8kE45xnNqIwTkEpQgAWcAnIDt1mghD7GmqSAwNR4eOoBB6SfFAvcv
         3B0YEC350S2LtjkeGQUcHqTcuPeVnytiE6hz2uf1MRE249NGPtHHNWjZahCezHb+xcEy
         s9na8ITujPAfkRLKFX17/XfThXmwEYI4sEtlenrZky0dcsrW4ob/ah6bdziZEjwUeGeo
         TzTw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GYs0cOub;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id k22si105978wmi.0.2021.10.06.05.58.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4HPZJ84KNGzy8m;
	Wed,  6 Oct 2021 14:58:16 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8061:5c51:6883:5436:5db]
 (2001:638:a01:8013::138) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 6 Oct
 2021 14:58:16 +0200
Message-ID: <d7952c28-ed16-5e73-84c4-c28803cb5892@oth-regensburg.de>
Date: Wed, 6 Oct 2021 14:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: Jailhouse Security
Content-Language: en-US
To: Moustafa Nofal <mustafa13e09940@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <84ad6258-709d-48cc-b3f2-38d0cc95057cn@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <84ad6258-709d-48cc-b3f2-38d0cc95057cn@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=GYs0cOub;
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

Hi,

On 06/10/2021 13:32, Moustafa Nofal wrote:
> I have a question regarding security at=C2=A0 the root-cell.
> The use case is shutting down the root cell, which definitely will shut=
=20
> other cells down. I understand that it is possible, to disable these=20
> commands, but is there any other possible approach?
> Is there any special security constraints, that Jailhouse user has to=20
> consider.

you want to forbid the root cell to shutdown a non-root cell, without an=20
acknowledgment from the non-root cell?

Take a look here:
https://github.com/lfd/jailhouse/blob/master/Documentation/hypervisor-inter=
faces.txt#L390

   Ralf

>=20
> Thanks in Advance
> Moustafa Noufale
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/84ad6258-709d-48cc-b3f2-3=
8d0cc95057cn%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/84ad6258-709d-48cc-b3f2-=
38d0cc95057cn%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d7952c28-ed16-5e73-84c4-c28803cb5892%40oth-regensburg.de.
