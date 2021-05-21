Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB3G5TWCQMGQEW2HHJGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E2338C1C5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 10:27:24 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id c15-20020a05640227cfb029038d710bf29csf4944883ede.16
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 01:27:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621585644; cv=pass;
        d=google.com; s=arc-20160816;
        b=XCPLNOl9sFaK3w+cwiXqoUB19+BFA7kJKLilSM9za32qEWy4zn5zWPt7yTE+xj6rue
         vZURcVHowFGO6myjnpn/VC/eLx8PhPg9lpeTHbqKoQKwW1nGJOJIhhDXyf+8EB6EJTNl
         xUWLOBxx4Fj2GtVhrX2icrBxZi2J+jBXSHDQY6AGq/myI+uM40mdFO7PMvpmgwGhjuje
         hEvbQc47PSFnqJwy8oPVCoiVjx6xM683m9u7Ur15rFBkGBfYK6myDghyHfZpUxfrNfnQ
         JSXnzc2AMfIovnP66iNdRgi4VolLTdnduAcLXlCh+y8HkA8kgABlYV0c9EWhtdzQS0DR
         Dvnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=hRtLV5rfBVFUGoKSWPuWG3xu+oQ1cDI8U8/NRN1BjBQ=;
        b=VSxpD+dYN9uJeEsV11Pwy8jB39bZGXLENDEHE+qtv7jUp4swlkDZ7/s+DpGchX+j35
         9KPUbIduqeLY4QWYea8lVq7xR0cAcer5fMXEb3RS8rPQW1CBIlU53x52WyKUWyV/Lqqv
         AX8FnCIZ0u5ZYI/IgBIlAcqGhQ+37zwPZ0fy3qc3c76FKQ2xzk2lEGiYdMyJ0lTmGeUv
         ee99V5ydMzj2135F+IoxvBMjzQROSXB2gBz09FuGaJE0kEmuLHsWnHkCT/P6W2G8mUxH
         4unt9CelKPCf4nH6uLIvAFtJqkcHemOpSotk6XH0iFzd3chZtGBptWnjx3iw8dLZhSf2
         t8Cw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=SY5KxTw5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hRtLV5rfBVFUGoKSWPuWG3xu+oQ1cDI8U8/NRN1BjBQ=;
        b=jCWe2abFnohfpsR2j9QZ7CoQBwdAPZyqZV1z88ODNbvOFiMO06As6q1q1MVUPVeM2s
         DUr/AGr9jP7vyMAhLaEvFthd83Wo91IgCUeFoFV+4Pf4TkM9YxSuFyj4Qxp+72GQJiYF
         +aALIVL1+FK0D6PFGZX5SejOvmdB00oBs+BdMQ4Gh3mQMefpEQDI3WU2a22S63m1eSsv
         1tGWvLHZI2ppnnnZ7RK+VtyOHbMBGtUPUyMM9v0tgnAoR5OBLzkZUy58F/5uWFjMkgqq
         ZhyYkEJQgBx6uuot1CHTQ4za/QpzVqdW+zqd3WR09aogbdrwf3pmYHqajv6Hwq8GypYM
         W9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hRtLV5rfBVFUGoKSWPuWG3xu+oQ1cDI8U8/NRN1BjBQ=;
        b=OtRNSaMpQqMDeo0BH0j90bBolh/vjySEomvxVNWVXtDIBck7u3Qo32yUMIt/r4JS8u
         A3WL5PEYpVJ2M60KxwUxzNmBDuMKMHudQMIk4MbnvIX71hDou1DYxzqHEyRS/TIpGvZZ
         8IwxsAG3pdxvSVGf/aZoGuibjkDBT79LQYiwHOBsbypU07A4kXclke5ghNDM6zaTvu22
         bvjDZJ3wcQwsSPsLcgrfdgnhI6kyQYtg/kWJOpW5b39/449k9Wlu0GpgrxHzalbXr8MW
         soC19gWV5eAbBOU1yxIA9CXBBaqv21adR5LMoRmwC7FRhoIzPPHSV0ov3gNP4NdQ8QZ+
         yIdQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533RzKZ4wIM8/6aYRpRjIoHE0CFoVj5QzpALGkvRDHTpRyDVugpO
	nhWaDljgduNl/Z/5fRhg//0=
X-Google-Smtp-Source: ABdhPJwh0JzGsrESaNAIVNk6WyEMFRF5uyKBbjlbuJ8Uv/8g2XJ5Jm2cQE4Uc9oKfWlj81Sfwn/9AQ==
X-Received: by 2002:a17:906:3615:: with SMTP id q21mr9200192ejb.414.1621585644562;
        Fri, 21 May 2021 01:27:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d997:: with SMTP id u23ls3147822eds.2.gmail; Fri, 21 May
 2021 01:27:23 -0700 (PDT)
X-Received: by 2002:aa7:d893:: with SMTP id u19mr10080290edq.258.1621585643494;
        Fri, 21 May 2021 01:27:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621585643; cv=none;
        d=google.com; s=arc-20160816;
        b=KX6cwnZNYnb4gaMNEn118sJgpzJ84EDYJBHTfLQExmchhs/INi8vbXYeS5yBox7spg
         fXNa1K2t0CRtdu78xnusmosZlREvgDNVk8o1idc3CIRKQdysGB4drQK+5S5FVTC483tZ
         D+GfRbN5/o8BazIL6M48jN/cnoCICAG+ElLkWXxgjCLuSP9LzuvT5no3mttd7hzogD9d
         BFswD4tLRGF2arRjvCHd4onOxyuPIeTABDpeIXG6ygo4Cz82wSBfVWd4R5p91VpF8zEq
         homiKmtVNl0MaRpTPVFD+oTOrm03J25qFhi84yQqgDvDaflCqyMrhSVebPZbnaRkFzUB
         GSWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EL73k1sJ518QKqaCLyNtwDdJlw9SlVwWfj5qQJd9qow=;
        b=qjlryXvdH59os51o6sgHwFRNhiTwvnYxIdI1ThSHkgD7mBw2CxMfwCXPiR3D7kJcxl
         HY5EBWVd37ueZNegN+giBIwsem5acD2IDOr/f6f3D3nMBPDltPgkF7gEKaq/qBzmQLyh
         L6iI/U1Op7DClLQo+JrJpGrQQ0btVdYVYhVwXdN/ns5Fa3xgkAkafZTSSFfJEyJiwFAr
         lyVJpEpvkpaJcPTkB0Xk/L8BEw/i9YeefdXOKzjGXWAc6WYMBgCQl/knq+PtjVj4+Lc0
         5VQcytViLY8ZBnWVcJ02wiqjTOv8TRdX/PUf47lI5cbeRaOW3pQEUZ6QWTLoTO8gd4un
         SZEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=SY5KxTw5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id m7si243648edq.5.2021.05.21.01.27.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 01:27:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4FmfqG73LQzy1d;
	Fri, 21 May 2021 10:27:22 +0200 (CEST)
Received: from [IPv6:2a02:810d:8fc0:44bc::762d] (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 21 May 2021 10:27:22 +0200
Subject: Re: [jailhouse-images][PATCH 3/4] start-qemu: x86: Add support for
 qemu 5.2
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
	<jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, <henning.schild@siemens.com>
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-4-florian.bezdeka@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <15e8af59-5488-81db-d28d-51bd32a14f9f@oth-regensburg.de>
Date: Fri, 21 May 2021 10:27:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521080646.488836-4-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=SY5KxTw5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 21/05/2021 10:06, Florian Bezdeka wrote:
> Qemu 5.2 adds a new CPU feature named kvm-asyncpf-int. The qemu 5.2
> changelog says:
>=20
> A new KVM feature which improves the handling of asynchronous page
> faults is available with -cpu ...,kvm-async-pf-int. This requires
> Linux 5.8.
>=20
> If this feature is enabled, the (jailhouse enabled) guest kernel will
> run into the following situation during "jailhouse cell create". To
> avoid that we need to disable this cpu feature when qemu supports it.
>=20
> jailhouse console output:
>=20
> FATAL: Unhandled MSR write: 4b564d02
> RIP: 0xffffffff8103e117 RSP: 0xffffc900000ffe60 FLAGS: 46
> RAX: 0x0000000000000000 RBX: 0x0000000000000003 RCX: 0x000000004b564d02
> RDX: 0x0000000000000000 RSI: 0x0000000000000000 RDI: 0x000000004b564d02
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x000000000200a002 CR4: 0x0000000000372ea0
> EFER: 0x0000000000000d01
>=20
> Stack trace:
>=20
> [   41.849660] #PF: supervisor instruction fetch in kernel mode
> [   41.850301] #PF: error_code(0x0010) - not-present page
> [   41.850839] PGD 0 P4D 0
> [   41.851121] Oops: 0010 [#1] PREEMPT SMP PTI
> [   41.851570] CPU: 3 PID: 25 Comm: cpuhp/3 Tainted: G           O      5=
.10.31 #1
> [   41.852326] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1=
.14.0-2.fc34 04/01/2014
> [   41.853207] RIP: 0010:0x0
> [   41.853494] Code: Unable to access opcode bytes at RIP 0xfffffffffffff=
fd6.
> [   41.854287] RSP: 0018:ffffc900000ffe60 EFLAGS: 00010046
> [   41.854962] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000004=
b564d02
> [   41.855605] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000004=
b564d02
> [   41.856242] RBP: ffff88803f9971a0 R08: ffff88803f9971c8 R09: ffff88800=
2c00058
> [   41.856873] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8=
103e827
> [   41.857511] R13: ffffffff8106efa1 R14: ffff88803f9971c8 R15: 000000000=
0000000
> [   41.858152] FS:  0000000000000000(0000) GS:ffff88803f980000(0000) knlG=
S:0000000000000000
> [   41.859131] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   41.859738] CR2: ffffffffffffffd6 CR3: 000000000200a002 CR4: 000000000=
0372ea0
> [   41.860378] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   41.860929] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   41.861488] Call Trace:
> [   41.861698]  kvm_pv_disable_apf.part.13+0x11/0x2f
> [   41.862084]  kvm_cpu_down_prepare+0x42/0x50
> [   41.862415]  cpuhp_invoke_callback+0xc1/0x238
> [   41.862760]  ? smpboot_unregister_percpu_thread+0x59/0x59
> [   41.863187]  cpuhp_thread_fun+0xdd/0x117
> [   41.863518]  smpboot_thread_fn+0x190/0x1a5
> [   41.863847]  kthread+0x112/0x11a
> [   41.864109]  ? kthread_unpark+0x62/0x62
> [   41.864412]  ret_from_fork+0x22/0x30
> [   41.864765] Modules linked in: af_packet snd_hda_codec_generic evdev p=
cspkr snd_hda_intel snd_intel_dspcfg serio_raw snd_hda_codec sg snd_hda_cor=
e snd_pcm snd_timer snd soundcore intel_agp intel_gtt button jailhouse(O) i=
p_tables x_tables ipv6 psmouse e1000e ptp i2c_i801 i2c_smbus lpc_ich pps_co=
re
> [   41.866836] CR2: 0000000000000000
> [   41.867105] ---[ end trace a63d134522cf2445 ]---
> [   41.867466] RIP: 0010:0x0
> [   41.867680] Code: Unable to access opcode bytes at RIP 0xfffffffffffff=
fd6.
> [   41.868216] RSP: 0018:ffffc900000ffe60 EFLAGS: 00010046
> [   41.868629] RAX: 0000000000000000 RBX: 0000000000000003 RCX: 000000004=
b564d02
> [   41.869185] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000004=
b564d02
> [   41.869736] RBP: ffff88803f9971a0 R08: ffff88803f9971c8 R09: ffff88800=
2c00058
> [   41.870325] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8=
103e827
> [   41.870993] R13: ffffffff8106efa1 R14: ffff88803f9971c8 R15: 000000000=
0000000
> [   41.871501] FS:  0000000000000000(0000) GS:ffff88803f980000(0000) knlG=
S:0000000000000000
> [   41.872076] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   41.872477] CR2: ffffffffffffffd6 CR3: 000000000200a002 CR4: 000000000=
0372ea0
> [   41.872972] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   41.873469] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
>=20
> Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
> ---
>  start-qemu.sh | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/start-qemu.sh b/start-qemu.sh
> index 7e95ec8..4e90fe3 100755
> --- a/start-qemu.sh
> +++ b/start-qemu.sh
> @@ -26,8 +26,15 @@ case "$1" in
>  	x86|x86_64|amd64)
>  		DISTRO_ARCH=3Damd64
>  		QEMU=3Dqemu-system-x86_64
> +		CPU_FEATURES=3D"-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-=
kvmclock"
> +
> +		# qemu >=3D 5.2 has kvm-asyncpf-int which needs to be disabled
> +		if ${QEMU} -cpu help | grep kvm-asyncpf-int > /dev/null; then
> +			CPU_FEATURES=3D"${CPU_FEATURES},-kvm-asyncpf-int"

This should also be mentioned in the README.md of the Jailhouse main
project.

Thanks
  Ralf

> +		fi
> +
>  		QEMU_EXTRA_ARGS=3D" \
> -			-cpu host,-kvm-pv-eoi,-kvm-pv-ipi,-kvm-asyncpf,-kvm-steal-time,-kvmcl=
ock \
> +			-cpu host,${CPU_FEATURES} \
>  			-smp 4 \
>  			-enable-kvm -machine q35,kernel_irqchip=3Dsplit \
>  			-serial vc \
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/15e8af59-5488-81db-d28d-51bd32a14f9f%40oth-regensburg.de.
