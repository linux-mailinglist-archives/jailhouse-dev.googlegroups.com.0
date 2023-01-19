Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBCPUU2PAMGQE55IF4SY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 75807674531
	for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Jan 2023 22:45:46 +0100 (CET)
Received: by mail-wm1-x33c.google.com with SMTP id 9-20020a05600c228900b003daf72fc827sf1855464wmf.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 19 Jan 2023 13:45:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674164746; cv=pass;
        d=google.com; s=arc-20160816;
        b=zeQ4JAa1BRcZj3zCfK98FwE3kICxiVzv31j8kCTakzv6DpBNxQXDaWO6O2Uvj0Mrpg
         BVdKVcAFavJDRPdXOfcwroV3kSXBBcct5BGZsvogR8qWoa1OqbDd9st0EZNuudbIPKzH
         USQ/rjX5+XUHyRMz3kejG7SK54NRyxECwGU6xyxceG9V97/7EPtpcXPmTQu17QIEnc0L
         oua/E20HEVq7yQnERpEs4kq9gYR0ShZ9xQjocnEXR0hDMoVQT2GI5xAyt55/fcsUH0pG
         avPb6aWO6KKoxu+HjEUS+rIJYqKWlh+3TAXTVZUoB7dLfw73lSFfspYgbCnUzqjOVLb+
         Xdew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature:dkim-signature;
        bh=Uv8QH2YFiNkhtFb3wY+awgNURMVASAqqoja2WkTgIN8=;
        b=nARW3egnTZEN64Cjq4R2kQ+oAt9dQ2thQNzySmmK2IZYRzDg90oLeJ2gwZu/b27xMZ
         EgG0RxCA+yWNv2fYDvlL+QBbXRzGQA9lCEcIgxz7B2sXpWdfUVCigwJcXKy750cj42pe
         pxyMExm5Bd123Qunmv4mEkkF6lN4d9MbZthEJz1FskIfec/k810IaGsXIVZtHdLdP0LH
         vNUaf6bIuT/sjzweHO+SPUC7t2i42ciky1ogixCzTC8MWPdr3m5cjBvh8dOUIeTLZbj0
         38lfdHrAm9/tEUCTUtYyLh/DS+KSc4CI/V2RmhD25ElcfXnyHX/1nKQ5PbK7U19QuT68
         xhJA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bhgkM70x;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Uv8QH2YFiNkhtFb3wY+awgNURMVASAqqoja2WkTgIN8=;
        b=I8MjwgVLjOjDfEXH5N7YNtnoN/79Gsj4FlIEckzc6lbm762hfQMaTgaQrrpyfhNNB6
         AJiePirTlE+qaDWqndqerg5My6kwXU1Lg+ChzGnThdeS70mRw3QbvOBQXFS1Zrq6Vcsw
         ONQb7zIumhayLmayEHVI1V5oL3d46IMan/gX4ZVOyORUpkTizn2jxVI5hzK1IQxKQctg
         97Ttt/eHIdlTq4FVjKm/owl8+/G4yLimvhhFO3uS0A/JvOt9xpwZGFcmF3SWYpPWJsUQ
         PMwZ0/wFBKxJCJisS8uLY9Uga4Gn6lwypN1ggqG+G+1Smj0nLeBW7DiDqPxw2E17dfPQ
         dBLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:message-id:date:subject:cc:to:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uv8QH2YFiNkhtFb3wY+awgNURMVASAqqoja2WkTgIN8=;
        b=LRvrm2fHb53vDT8YXZnygz3FP9z56F9GtXmH47MRZhPufVTZ92mbrPgDhS/99EuVB2
         wjGViDZWDmX2LUEo3TmkHRtrdRznPD2EuT04ZvU1V3BpDhsik/UFZfLiHQgx9tFL//AL
         YOjoFD0wcaOdIowgAuDRPuZ2B/iITkCdsSEO/l3Qs7iY8k7dhlVLAnnjA9564d/A1IRY
         km/q2FWd5Bsznu9LjRuKB2WPZpILUADWsLk1GabFqq5SBPfo2B90BZvNfsBueXXDWOwm
         cIe3Y1RyrXZ1+y99jFppc7tkCeWB51wYCFYM1TfDngepRvEjhjnX2YkCBxF5KsEalUxG
         9v5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uv8QH2YFiNkhtFb3wY+awgNURMVASAqqoja2WkTgIN8=;
        b=d93At3gKpsdmMX1f7cEEMn+wUYyEg6knvKOGkjr+2cBunddYwde7HeyVt6Nr0J3Pmn
         xu5qVIi43/uFClsU6hJKyoKZV2+ieCNyyEz5T4Ua8dpjqw3WYAsO5koG1RbgWe2Um3Jq
         shqvJTnOWIm+qleLEl0Zi6B45pFQU5oW+ViN6YaXC4eDi0BjwSXUzSZvj7LD0p/YZp3F
         U9aj95BEfoO1Yh4tMwB5EV/GsumYGQ1T5jzw1RJ7DKJkUb+H/qHUVPzKduEPRU7UzPHa
         6tbTGCVONOUvyCcNmUIGQWFKHzZrFM37WDs8jbE5PnlvYZ4JF64tXHGVqSgbZ0hG44W7
         4sYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqrCC1GC9fP4v4Ll22K8XzhvmOjkNkzDIivICDGDDPt7zEWmeW3
	V2s/wDI4HP4y5O2SeeEJ/fU=
X-Google-Smtp-Source: AMrXdXsjRUGyz2Oo3ogCaAskET68j2wjd3Q2dx9yEI8rpmzG/he4hrAO+WvJgOkph00CQaRFe/eDqg==
X-Received: by 2002:a05:600c:444b:b0:3db:74:7ff2 with SMTP id v11-20020a05600c444b00b003db00747ff2mr779392wmn.87.1674164745955;
        Thu, 19 Jan 2023 13:45:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c12:b0:3c6:c1ff:1fd with SMTP id
 j18-20020a05600c1c1200b003c6c1ff01fdls3259143wms.2.-pod-canary-gmail; Thu, 19
 Jan 2023 13:45:44 -0800 (PST)
X-Received: by 2002:a05:600c:35cf:b0:3d3:49db:d95 with SMTP id r15-20020a05600c35cf00b003d349db0d95mr11782055wmq.37.1674164744378;
        Thu, 19 Jan 2023 13:45:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674164744; cv=none;
        d=google.com; s=arc-20160816;
        b=MIu4VpMa4EYbnxZiiSU59FJpM5shWLBR6jUKYWsqRRuSPTdeb2absmhWji/rjFX8LW
         YOPNvDNeENCHyI+Kf7WZqgRZnijc3lOES9FAhSs/CsW8IYb4ZLw0jpr3I8srndEUWgeG
         8Jww2J8atLKOJgGxwhdSN4NLjqaEbSQRLZxcLVz5CbSVBn8+ajvlAZ223b6RfB9ProLT
         BZYBsQeL5mYypsUFN6Q0Q2cgl1nYnjegLtPD/3i8sF5xMvFmalfaFhQEA/XamXkFNKRq
         kGfk86AxE7l/vp4nm0IfOnGT/nDGNs1fC2mfNEvu4EbDVdT5OUD1qIvXR4KlbXFAMUFK
         jNmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=B0GxWldhw7xmIV7p5E6acaRzRBseyZvRF29XKnJOSiw=;
        b=ZgRbu0gfYa3uAcdZTHPwGqoVdhpeTHLUtVg+ypOepZul2Ilct7F6bDYgd7PteJqx7D
         B/2TNEB0k0QJ/01yfMdl9kLy0bXDqjbRY6ZmQ//oXY9tbEitv7509Tnn9RusvCftmyfL
         hu40Fm2+8dGPVHHWW5i7dsmdNedwigJidhX8WN0plaMiC7tdmFwYzYw0EDqi/QN23PHh
         5vWfBpFWomu0oIbKKQ7CinYMR+7nZWu9KeVT8ew04D6YnwEms6UTRyAAW3HCh2WFBn5T
         K2xYjoOBzz1Kev95SrKbOKX8rZ6Huca9kartkVqCWQGVEWrXHki4oWpUsphkzsAwAgff
         cz6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=bhgkM70x;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com. [2a00:1450:4864:20::332])
        by gmr-mx.google.com with ESMTPS id s4-20020a05600c384400b003d9c774d43fsi339002wmr.2.2023.01.19.13.45.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 13:45:44 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2a00:1450:4864:20::332 as permitted sender) client-ip=2a00:1450:4864:20::332;
Received: by mail-wm1-x332.google.com with SMTP id j17so2634939wms.0
        for <jailhouse-dev@googlegroups.com>; Thu, 19 Jan 2023 13:45:44 -0800 (PST)
X-Received: by 2002:a05:600c:4e03:b0:3db:262a:8ef with SMTP id b3-20020a05600c4e0300b003db262a08efmr2906188wmq.38.1674164743909;
        Thu, 19 Jan 2023 13:45:43 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:3d57:310b:6bc8:3755])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003c70191f267sm337808wmq.39.2023.01.19.13.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:45:43 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	jailhouse-dev@googlegroups.com
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] Add support for Renesas RZ/G2M
Date: Thu, 19 Jan 2023 21:45:32 +0000
Message-Id: <20230119214536.5247-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=bhgkM70x;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2a00:1450:4864:20::332 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Content-Type: text/plain; charset="UTF-8"
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].

Changes apply on top of next branch [2] and the kernel used for testing is
5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.

[0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
[1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
[2] https://github.com/siemens/jailhouse/tree/next (e57d1eff)
[3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0

v1->v2
* Added inmate demo
* Added support for IVSHMEM
* Rebased on current next

Note,
* For IVSHMEM Linux demo I have tested by pinging the root and inmate cell
* For IVSHMEM bare metal demo I ran the "ivshmem-demo -t 1" and noticed the
  interrupt counters on root and inmate cells

Cheers,
Prabhakar

Lad Prabhakar (3):
  configs: arm64: Add root cell config for Renesas RZ/G2M SoC
  configs: arm64: Add linux-inmate-demo cell config for Renesas RZ/G2M
  configs: arm64: Add inmate-demo cell config for Renesas RZ/G2M

 configs/arm64/dts/inmate-r8a774a1-hihope.dts |  244 ++++
 configs/arm64/renesas-r8a774a1-inmate-demo.c |  140 ++
 configs/arm64/renesas-r8a774a1-linux-demo.c  |  184 +++
 configs/arm64/renesas-r8a774a1.c             | 1235 ++++++++++++++++++
 4 files changed, 1803 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
 create mode 100644 configs/arm64/renesas-r8a774a1-inmate-demo.c
 create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
 create mode 100644 configs/arm64/renesas-r8a774a1.c

-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230119214536.5247-1-prabhakar.mahadev-lad.rj%40bp.renesas.com.
