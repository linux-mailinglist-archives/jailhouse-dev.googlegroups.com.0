Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ43T2CQMGQEIZ5X4AY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6A38C516
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:38:59 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id i8-20020a1709068508b02903d75f46b7aesf5699745ejx.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:38:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593539; cv=pass;
        d=google.com; s=arc-20160816;
        b=oV4fP0PzsJ2Yo142LjJh4E1IpyQDLgY4joPplz7B/2+V9SgoHr8oMFNJhALbY16kI2
         P/B5WEtDt6tJMmjVbiZ6iw95gLJPY5SC6L/Z1x4fiPhbm69keFZCvR8cwhHpOOjliqzr
         IyIklcsXyxXZvoZqGBgbAqFxuAAIAum9WOAMUxGg/QFha2PVNEJjdnlLRRfl9b1A0Aug
         aX19l6CF8mjqio16/gdwh/zCXLN6G+9EH2aFRmS3Gk2/QLfN6XWSux/mL1vC9z3y9tSa
         viQEOruD6OXnR93z184DplNc49JdoV10uCVTS2moPtjtK2geFHwRGPUtAm9ZKJbk8+h2
         rtwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=+aKo2I+Qj+IaXIBtdBTke0GzaW/K0HMoNXlj3zUAUGo=;
        b=DI3i4jJTV0tXp+ipFYUIUFrA8l6bw2ZYT5W8N6X1lfKnDab469J5BbGaVy6rGGnXJA
         Lw10wOmpsYUDbl4GT96WKkf5VKZcrUXPPBEcjoa76lAIKVJEn9uboJPfoteeY4Gzjr/U
         Wln1F2F25UDs8qQN0DZwnFjwWaTTm5Iqirm1v820+qzHY0mciKNV9bDiTsF+3UL0ySve
         jMdTvpYVFcDtKLOL71PhqqzMcvIGoRTTN1JwFVh1U+4XUD6GbUHMKJ9lgQgo8gZTTzOA
         96/ClBg/osF6LUG9PeDrvAZ4+cnLFnoonzI5S5QNrI622WdfERmyP/9dd4IRyP9+4391
         UM8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+aKo2I+Qj+IaXIBtdBTke0GzaW/K0HMoNXlj3zUAUGo=;
        b=LYrsqUomQyVglvq4HKc0W7wXPWA/AxCSxx1P5ogxhaTNdNQjI8gLuhyXyAhhe1+du9
         5VtYI6+J0x1vUcr39kVB2+MBykyXt2rYkYfQ7ri2GZxFP35LSEO6HVx9uCHkHVU0qDC8
         VnjTfVqoh8Zx+L+BH6SIinsYIcM0XCAsbgqPePX9xp/6G9R52kuTtzhZdmPCvUh+5cBZ
         e6VEL6Rph6LhK9hEd5MVXgDGgSVHYk+KT22uyBlH+9Qoo172XVpNTtfBXDrDrMNdBYGH
         /gYaJkzTuto77Ax7aR8vZ+3PMQ+EIZYe7PjuucgehpApuWn/G97ttzL0I4enJZUr6kvI
         Z9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+aKo2I+Qj+IaXIBtdBTke0GzaW/K0HMoNXlj3zUAUGo=;
        b=jnX7CvBmLJkx7H5WfijpqFSjLuY8rwgsJ8LK9Wdi0Ei8TSxl3DQvJSOQ0/dDVKEqMj
         V8GBjl7u6AQaaBF9+FUNJXCcf6IH5OVwEYX2Y8DL/ePnFhlFD0SZHhCAgURH9ZQnud1E
         aKSyuccWsSIEv2/41HhUL5nntlTTJyalHpfREMsZtcEPMCYoKPkJoWBw17JzOsuASRm7
         a1j54i5+ciYM5XmrDI0VvxGsYQPbRl6yYXwWHKQVWqWZnNEIQPolEL+HM9Ykmj1YZWk6
         zahAH/zQFTKCTmiSWnh581bRuPiCvgusoVDnzXShawQxw47jX8BO+SqDtmecyQMbjjAn
         R5Ag==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ePh5z+6VxOnzOQSvMAb2/MilLvssDuktqzfkpj+S7X3l7zqbh
	H2hYVH0tbe3K5Rifqxz3B9s=
X-Google-Smtp-Source: ABdhPJwseI3lqq1LwkD+fVrSrg8AMWBDbewMthlGcXk35JcTin90573pZn8qWk8NYC7Lf3WNJsLaZA==
X-Received: by 2002:a05:6402:7d7:: with SMTP id u23mr10513138edy.196.1621593539553;
        Fri, 21 May 2021 03:38:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:ca0c:: with SMTP id jt12ls48885ejb.11.gmail; Fri, 21
 May 2021 03:38:58 -0700 (PDT)
X-Received: by 2002:a17:906:bb0e:: with SMTP id jz14mr9516898ejb.285.1621593538493;
        Fri, 21 May 2021 03:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593538; cv=none;
        d=google.com; s=arc-20160816;
        b=rvIz4cFxssb0oMLkcSbUlqOHNLSoaSyuqJY/DOJ4A0G5+iSWlCWX5XKU1Z18Vut24E
         zi4qGgJsg5KJxOWiS4JR6M6fVAGOe/FfTCrQqdcmzl2AOJDGh5+Zi8+qJG0yYP6qPHBR
         YTaQ1BZOMkLTO6xmfLHWG/4/2oeZKWG3E+fdQUSP/blLHm5ymjkFot8UbN7BelfcfeZd
         qRQEJed0uQ/QDxz5nG6Kl+Ca1SNtoR31tFOmheCE5cX4w0dVL0eFG3UiArmI/OEyHQnb
         oPbu0oLlP2+efHwAu7mbXQ2/bYskH5NVEQe65zaOi5hCyno+sjrFGTyUxzNfieUHi+8Y
         LBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=M7O0jI1IJkZ8kJI475T3hlst9e2qkrSv6YDqXO+vCCA=;
        b=oTqCeUu+SNsS4DgqcgiDRbcIxq9VGtAeeUE3j5op2pHxxvp9gKDsMzRUvhhC8mWv5I
         ikddCF0p2ITwqSbAR0wczMBsMVfymtJLc7uYTKrlszRR7EHPw9pfE0xnslaspdAtLWoS
         QM0bB/7Zl7k6LAdbdNlcVe3zEjeWNyj5ItlxtRXuWIQvQ1TB6DCifqhyAOXj4FufiSsS
         HcXnbxLQdogL+F083xh3mSI87OKJztLaCEL0TZfLL3LgG8Gi7YF7fgQQJ4nwJFdMrc08
         oe9O9CABI5DEG5JEUCKtNAwLBDDzS0dFl6jy7I04LCw8MgeWFW9ray0rwNFvU+c7/srO
         JEKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r21si428851ejo.0.2021.05.21.03.38.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAcwrn004375
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:38:58 +0200
Received: from [167.87.240.49] ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAcvD4001357;
	Fri, 21 May 2021 12:38:57 +0200
Subject: Re: [jailhouse-images][PATCH 3/4] start-qemu: x86: Add support for
 qemu 5.2
To: Florian Bezdeka <florian.bezdeka@siemens.com>,
        jailhouse-dev@googlegroups.com
Cc: henning.schild@siemens.com
References: <20210521080646.488836-1-florian.bezdeka@siemens.com>
 <20210521080646.488836-4-florian.bezdeka@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <8ab700d0-8176-8493-1ea2-05ab328ee294@siemens.com>
Date: Fri, 21 May 2021 12:38:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521080646.488836-4-florian.bezdeka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 21.05.21 10:06, Florian Bezdeka wrote:
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

Thanks, merged to next.

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
jailhouse-dev/8ab700d0-8176-8493-1ea2-05ab328ee294%40siemens.com.
