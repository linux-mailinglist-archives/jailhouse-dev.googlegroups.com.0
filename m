Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHN4XWQKGQELRTQPCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968AE9AF6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 12:41:13 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id t203sf722098wmt.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Oct 2019 04:41:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572435673; cv=pass;
        d=google.com; s=arc-20160816;
        b=z4PFTmZRAPN/obvdAazyKiG6lDFDwLwLCamZGt3SX+eJz0EW0LM4upsmVYZjhfv937
         Eqj8EN4G0ix1MRFdTUWMDis6ApOICinZ7J7R5X23B2SIZB6jA1TVNcNW8kHEA6mFv6yE
         f/dM+TsUg817x5N1fUZPrvrhdCwC5r0/mvaTYU735M+Ru7mtdNwhyXmp5xqXO+oSIIeh
         t+RRKpLVlviWb8h98b8XIllpJeIqqzYXZtXvHgUvjI52UTjo/+NvTWpD2vEkb4y7ieoK
         ayC+9vG/4j5Koor1tHgST8yUiS72oruyNlwvQu5fUurkalVI9XAtmO6TeHydPgOMLHWN
         8n5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LLBgTB9yjSkdsvporWbnXH2BlK6XgVSSaxq4z22JwLc=;
        b=WV4cVjes30nqPYYuGMCWX80mm3S+s4DSQ6NA5iZKQXSFev6LaUQ/9RSqnxX6ZtgiQ5
         NGBm7cfSpXjDe/GmZ3KAdLtoIKWEzS/lBFsQ87DjGZKUnfistIr4t73Db0tnYkw3A+jo
         72VnkvEQ8RTTHv/UbrE1w0pSQjXv+BPAbVCeIMTQO8IerNOXTWU9nrHqUpQejE3Ah4C+
         C7pn4Dmi4oOTX6wqSbrOf+BTeb2eZ/JXwQavxBbRTNxIBFFLR5zdaJK0hcsCulu+QLYY
         6VYnVhm/AVYwsvZz1cu3536hEmnAk+EmBvKoGiVKt0I2TXj0WGkkZfEfKbQ29ym6l304
         8+WQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LLBgTB9yjSkdsvporWbnXH2BlK6XgVSSaxq4z22JwLc=;
        b=e+5mprE9Cvk1cJpE9ykhBzZCj2YrCVMco9zDr/JJPePOLF7uPPGKazkpn8Y6s3ore0
         G2PtnCQXQrHzhzt75PtBqfZJPKZ4mRR6qLF7oF/6hZJSylr3doojq0xy6bUEWkdMstNu
         zeS9TLDcs3qtarBiuxzghfyX+wR2svqWLUtl+tSY9rWv2YcijLFMmnHue5T6MEwFdczo
         w2NP8POplBr9rRMrIyjnIvtP0mBsd/UNxDIM+e7J0Kx1B0FWA5mMRgWEDQrXfrbYWysj
         BgI0SI3EcevKbkVsLThF6AboUNWyrxeAQWx5ok2S7zYUfyD2CMrIXTaTrzy20A3sBQlm
         AfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LLBgTB9yjSkdsvporWbnXH2BlK6XgVSSaxq4z22JwLc=;
        b=mjJRa1hUsnUTBg41bEjK3g7vim5YybpVtFfMNnHrbxO3nPMflvJ5YDAelzcc0ZSHgI
         3tioANU67ZsGGg67u9KDFUTkvlPK+/fDSZ2rCOw+UiM9twTsNeph8TqF+oKZ+VnbEif+
         oh3gASLvtmxBHZz8N2MsLHsIbCnptvZIPNeoMgrtZdU+4H1FgYizdaT+kV7ILaGDxS5O
         93+EkOMuj8CfsH1QpVsFXfuMa4f8b+iu88ankplAY+4sG+sCHbMyIumRPPotyGyJTC8o
         kP6VCVE755iFHRH4lyhzq4FXTQht3N2sGLXO0cOZmLDOqiFmsB8KO3ZIDNNCVhkjBgG/
         uZNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX7ZtgBiahOm8//m8aFuxFYcM7ZrqWFf0eOziF5kscrU64cO+NN
	kL2HPQUkodX+5eEBY9vod3E=
X-Google-Smtp-Source: APXvYqwZCqOg+nN2ikzbTfKC15kDBAFNl+9wkHmN+oXuwPOJtG9n6oKLDUF48Y0lldmewj7JOw2BPQ==
X-Received: by 2002:adf:c105:: with SMTP id r5mr24496888wre.125.1572435673106;
        Wed, 30 Oct 2019 04:41:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f091:: with SMTP id n17ls1543898wro.4.gmail; Wed, 30 Oct
 2019 04:41:12 -0700 (PDT)
X-Received: by 2002:adf:f945:: with SMTP id q5mr449537wrr.33.1572435672274;
        Wed, 30 Oct 2019 04:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572435672; cv=none;
        d=google.com; s=arc-20160816;
        b=BKqJlweSNoZCSPP+R2nHX6Y5wrUpYmnJZG81H2I+E8/Fe71u+t/HXP5PEEI8y/yoO2
         PzMVCSRt+nzm3phO02+Z/B1AJMv44AcqSwySTu+IA3sX+D9h9nCt7Y7n8kuVbF02ceys
         XVFrGzHwyfuaSkT7UxF98OwWvly1+VUGv0v+gpC9rG5XIs7FCsC5hzdUmk9Krq2UmpQJ
         vv+ETe6EqlusbTXQwZRrrrncjuGtbEPgJrVJrhVqAZPJdfzeGoZL55dd8idiDN+p/vua
         6Ajb3up0W2XM9RQ3CDrv7mjoFTFc9FS7iI7Lyx15zwMIXDid6VO2EeAUEHg8nhpSFcBE
         Yn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=XsiOM+8MfwohW5qMS+1D6oI0PoU47ENwzmaRRKwdUuo=;
        b=iE2dATx9YC/Ul+Hvl4GKNspbVaEz2M2KNGkkbnrkVM1q4pBTb3UYuz2ER0o1Bfh6Ud
         gaYPZBzvaiZMMnN9k1jL0FG/buiRQnrclArME7ZPHLCiMhvyFBjIL3wjBlfXg0fYZmzL
         g5+OqoaGyoXwGEHPqB8shm3fz5iy7vqnYVnLwNZVspPgI2tMzR040Mc1wYhZ8Rh+z7My
         t5rLAeAEjYuwbe4lkoN8dAH7xHCafK0/e+c/CKnfXV6m56N4d+PD7RHqNp534IkrHbyr
         ng+WfpyOm4ksV5u2DZ+U/TB1gNV4aaLLd+B11qobvh0K+ZebYEn3B40lsp9hu7/uFpC7
         pWBA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id w2si84514wrn.4.2019.10.30.04.41.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 04:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x9UBfBmq006339
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2019 12:41:11 +0100
Received: from [167.87.50.140] ([167.87.50.140])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x9UBfAqO014581;
	Wed, 30 Oct 2019 12:41:10 +0100
Subject: Re: v0.9 vs v1.1 interrupt latency raise
To: Chung-Fan Yang <sonic.tw.tp@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <a54a651c-13de-4aa1-9c32-475ebddc4e6f@googlegroups.com>
 <6defc2d1-96ac-c470-818d-1c9a8e1d8725@web.de>
 <eed4bd9a-7020-4182-9949-d529bef7b3b2@googlegroups.com>
 <48bb5fe2-9b9f-4ad1-872e-9eae4bdd2c43@googlegroups.com>
 <20191025155257.6af12e29@md1za8fc.ad001.siemens.net>
 <76ecfa10-3a69-b5bc-382a-48a59c345637@siemens.com>
 <579d40f1-a8f4-4144-9405-3bba1ea23c14@googlegroups.com>
 <2151b869-9732-4483-8659-90234a971f1b@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <09cf7ef6-0bb0-0d3e-cab3-493c500c6559@siemens.com>
Date: Wed, 30 Oct 2019 12:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <2151b869-9732-4483-8659-90234a971f1b@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 30.10.19 09:37, Chung-Fan Yang wrote:
> =C2=A0
> Alright, I did the bisect, checked the inmate library and PM.
>=20
> I will summarize first, the fault seems like to be in the wip/ivshmem2.
> P-state was already disabled (Silly me, forgot what I have already done.)
> Code steal from inmate library seems fine.
>=20
> Let me describe my setup first.
> I am using the wip/ivshmem2, because my application favors
> unidirectional pipes and multiple interrupts between cells.
> I have been using the v0.9.1 with an old version of ivshmem2(15ee5278),
> which has lstate/rstate, etc.
>=20
> When I need to test with non-root-Linux, I upgraded to v0.11 for the new
> mmio decoder.
> Along this process, I rebased the wip/ivshmem2 to v0.11 branch, which is
> the new, multi-peer ivshmem2(5c90e846).
> I rewrite the drivers of RTOS, too.
>=20
> Also, I changed the root cell Linux kernel version from 4.9 to 4.19.
> (Both wil PREEMPT_RT patch installed)
>=20
> So I changed:
> =C2=A0* Linux kernel version
> =C2=A0* Jailhouse version
> =C2=A0* ivshmem2 version
>=20
> Today, I cherry-picked the new multi-peer ivshmem2 onto:
> =C2=A0* v0.11
> =C2=A0* v0.10
> =C2=A0* v0.9.1
> and tested with Linux 4.19.
> All of them has a ~25.8us latency.
>=20
> The baseline, Linux 4.9 /w v0.9.1 /w old ivshmem2 is 10.87us.
>=20
> Then I tested Linux 4.9 /w v0.9.1 /w new multi-peer ivshmem2. It has a
> latency of 28.62us.
>=20
> It seems like using the new ivshmem2 mechanism cause the execution to
> slow down.
> I didn't find a specific hot-spot, so certain resource contention should
> be the cause.

Interesting findings already, but I'm afraid we will need to dig deeper:
Can you describe what all is part of your measured latency path? Do you
just run code in guest mode or do you also trigger VM exits, e.g. to
issue ivshmem interrupts to a remote side? Maybe you can sample some
latencies along the critical path so that we have a better picture about
where we lose time, overall or rather on specific actions.

>=20
> BTW, I has code that "executes" on the ivshmem region, but I don't think
> this should be a problem, isn't it?

It wasn't designed for it but it should work.

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
jailhouse-dev/09cf7ef6-0bb0-0d3e-cab3-493c500c6559%40siemens.com.
