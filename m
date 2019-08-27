Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIHSSPVQKGQEGSK3EUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB4E9E45E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Aug 2019 11:34:25 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id h13sf3191743lfm.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 27 Aug 2019 02:34:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566898465; cv=pass;
        d=google.com; s=arc-20160816;
        b=t0/209X6RajVb6oIVe00SAL/JLSzUoQqK7kwH5Fz6LhaTKTv4mZC7QJ6ENWD6naFAM
         sw0T0ZYpiZ4vmurDl6PuGNApMjDNbS3HYCaahib+jnTKT06Kss2wnpoWgKpLfgLr+xD+
         UrmnIjWoUW0uUd6x0dwRvj23MaIpGIisSa3UEbzxyuA5REhjt5jFC5ah7zcPgFNL7wYe
         gUx+SLdem4Gpq2Cv/yfjefwJTdhPd3ZKpStkgPcLH4Z/Y3dod0oPltt7vG44W4G+cvQg
         PB4GXSN41LmJN5vVLBy6XG1KumXWWjMkd4byydKKhetm9c4ATNWops9WUpugN3kxT6se
         InVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ugb0QVxS86mxJvAaugayuZ+LmIL1rPw36CvS8y9vF1U=;
        b=ZBaUAG7dnOgoyOOGkBQzOzYIp1kw31dPB1PJRXw6wEcexESXi63glq4lC6t8y70pk/
         I14B5gWKz1YqTeLvxbKPLZkA0YHbXNTHgiQr8orP10zK5HHKeBxt+O601+UVZMNOsDai
         xTJFN2QCFbCPqiENLfx23FEc9PYSf8/UPTN2IywAE29CwxODbzmAF7vX8UHuCPcPBsw9
         dKGH8Cp+8xrLl8keKn2EDYCWIDIE17Px65xnVVYnpmAuDuwfNxqnyXX/FmiZRK/egQZ0
         XiDtaTcii1dLH9nDxdj/ikBQL/8vi/nvsYkRDlDbhkWZ7xszbJQhvJjuOiWOgmIYCeTJ
         Kx6g==
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
        bh=ugb0QVxS86mxJvAaugayuZ+LmIL1rPw36CvS8y9vF1U=;
        b=RSRaSXb4mvKgVhbuFzGvJCDX4D/0Xi08rZAaGsoUM601X/ynvoF8cNikTzmVKmjCYi
         Vqjoci+bed0f71YXMOr1aEeZWWdS92cwFdNMPQQa7eZ+fAX7Crh9G/3pypquq9O4w8bn
         Ch13c3HOFYaMy3HxzwRasJ5AQu1IpKIa0AeUAZZZrwnHTCo5V9NXcJt9FRBp5H2deAs8
         7UrsFTrIUlgTM1RFMSUG8HHvZF2L2QcYxJN4rDp1ZWIZ7Xq1/rGx7h67pJHp0C5zpMFL
         +T/MMBeQg94OOQAoevUNbyraD6n7OinpoGRyMWoFhN7iRAtIEwQYboTjrFFYfO+RQw02
         IUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ugb0QVxS86mxJvAaugayuZ+LmIL1rPw36CvS8y9vF1U=;
        b=ovx6saAsn959wu4OKbo0is/PwveBa34SDcFcojY9t9Ig89ZaswAaHoyLLturbuda4D
         bAMWz7BrDSi6g+CAffH2x3XLiaRgFRayOxh3eBZWAl0aunRMHNbm2iOM8Ad6DR/MeSm+
         UFHAhHaSGvSwSOiX1I0Wg6r3A6bT6/kJPVbONwd9VAQNpiN3iYMZ1PDUzHqSb9WTkR2y
         ySHnhvrbiW+3PoSNjD2cfzOnYCwTyMKxngOg6hu+Zg20wRYtG/Jr5UuT6Y+XlfiA3I0A
         i3jN6AwIeDTTg/+ljRHdscVheG4fNaj25GX+hjN1/u73rg9CDfcNA6U1OelputnH9lbK
         nA9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV2iBFNA4OiRaZoI8f9q5VclDGzRNpfxcyI1OC8rGq7TGXUXzwD
	Mor1l5MOrQGoCFleAbqnTiI=
X-Google-Smtp-Source: APXvYqyuk5CVOVD3RQJL5s4Bn51LNwcpYCTjHStcOEGHldkSEvnKXyeNEWR9gJTv/74vlwdywPXK1Q==
X-Received: by 2002:a19:e006:: with SMTP id x6mr2718158lfg.165.1566898465036;
        Tue, 27 Aug 2019 02:34:25 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:8c0c:: with SMTP id o12ls1800722lfd.12.gmail; Tue, 27
 Aug 2019 02:34:24 -0700 (PDT)
X-Received: by 2002:ac2:4185:: with SMTP id z5mr13429483lfh.68.1566898464157;
        Tue, 27 Aug 2019 02:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566898464; cv=none;
        d=google.com; s=arc-20160816;
        b=WitCHOz7veazjSkt2e5jh7eIlmrNAKuIt9MUgLxjdEhdPvDGnySuWOje5wtoCBRU81
         IQWxqxGgjnEj1rGEftjeGlNFsobYRGo0rA76tNMTwgrdwj1I9pdzZONhc20a3mJBceZq
         2Wh1n5vjUR/ZYbVOs41ThSWUGqPC7FoSLWvhSsaD9cViig3CJ6mg/+7y6LbSsecqjw6P
         cmDeZdmsckkwhM2HnTtJuJ/ry+nX/Sj8/fsMZ0Wt50ZuRvOIRCkGmR7OH/GnRbGEWEQl
         /z7H9KR+eHXbD5+Tqu61QqiIdAuPsFbvr02G0Sfim81+8rAMls7+tNshDGpn/JRzfrc1
         9jqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=lDbJ9Fgn6+f0FafCKCupx+P5vW5be6zThJZatLsZW4Q=;
        b=wTFxaqvzeib1l1DR+VSs2tWzaMPs9Tt+jPLnNDEcCwzFY9cSjl/bXrxi6yjYxw4HaM
         umo/Wcv7jMt9Osi33qWgHJ9zzrclpSV2m91VRibK5OxBuplPg1e1jmsXrf72FYFggG2M
         wYvc6Z6nPjDqGx2yUOyxJsGCF4VoI4ltSN8F8xB7IZ52dAZuNo5moDMSSsziz2ermY78
         5Dtn+VlGIk+ghz5MjnTK2uDxlHaiizES7MtcyT9q5gaZip/HQ+Cf3MoF5EKip3vi9PRd
         rXB/KQu+CqlogonYWySuBRM/lnBOXE4CCnxtWPUkYXsrigWuI6C9gBjjhupRNgr2edv4
         2K+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z16si377856lfe.0.2019.08.27.02.34.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Aug 2019 02:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x7R9YME3024573
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Aug 2019 11:34:22 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7R9YLLL032515;
	Tue, 27 Aug 2019 11:34:21 +0200
Subject: Re: Colored Linux as inmate
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
 <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
 <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
 <1c8ad7db-eb23-034d-dbad-33267d4227f1@siemens.com>
 <12e2c8ec-e900-4d3a-9f78-086803483af6@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <be855ebb-4ed7-2f57-5870-ace709135e4f@siemens.com>
Date: Tue, 27 Aug 2019 11:34:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <12e2c8ec-e900-4d3a-9f78-086803483af6@googlegroups.com>
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

On 26.08.19 20:09, Jo=C3=A3o Reis wrote:
> I am using inmate-zynqmp.dtb for non-root cell, which is not being used b=
y root=20
> cell. Or are you referring to Petalinux's device tree? In that case, what=
 nodes=20
> must i alter? The memory node?
>=20

If you are already using the inmate dtb, you won't see most of the resource=
s in=20
/proc/iomem that you have in the root cell - or you are still looking at th=
e=20
root cell. This is what you get normally in the inmate with uart access (ta=
ken=20
on ultra96):

# cat /proc/iomem
10000000-1000ffff : pci@fc000000
   10000000-100000ff : 0000:00:00.0
     10000000-100000ff : ivshmem-net
74000000-7beeffff : System RAM
   74000000-74000fff : reserved
   74280000-7509ffff : Kernel code
   750a0000-751bffff : reserved
   751c0000-75368fff : Kernel data
   7638a000-76b5cfff : reserved
   79c00000-7bbfffff : reserved
   7bead000-7bed8fff : reserved
   7bedb000-7bedcfff : reserved
   7bedd000-7beddfff : reserved
   7bede000-7bee1fff : reserved
   7bee2000-7bee3fff : reserved
   7bee4000-7beeffff : reserved
7bf00000-7bffffff : ivshmem-net
fc000000-fc0fffff : PCI ECAM
ff010000-ff010fff : xuartps

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
jailhouse-dev/be855ebb-4ed7-2f57-5870-ace709135e4f%40siemens.com.
