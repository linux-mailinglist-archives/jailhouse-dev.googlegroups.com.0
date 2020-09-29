Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBVFHZP5QKGQE454GFYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B2A27BD1E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 29 Sep 2020 08:27:33 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id f22sf817120ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 28 Sep 2020 23:27:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601360853; cv=pass;
        d=google.com; s=arc-20160816;
        b=FIqQjtrH07jR7q4Dod9BqWRBdcHvOkBLXxb6+1y/dohrQywF1ZRMJkQKgkDirBytt6
         d9hGsN+pzUCWJoLu73q7kH33MA8YIB+y60xbmL0u3yFX3tN1ZgPAeSoaNumNXbJDIVrQ
         zi3zYw7tDjonbKoJuDCC4GRZSxvHBLwmu0Jesci72KRUXQgUXqotYUQ6VK54mJtFwgSm
         xinNTj/gfFhL8XAdiE9Cjf+vzfwz9R8hleQwIMXcYBg9ggoHJKNFY9a/5te55EncD4aj
         5PozSl84mANiUGPlnaGUCPIFM9qmb4zxRfv9jVMrGEtwZlaS4kpDxmE+46OdXhjX0I5F
         8U9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=CcM0UYyPpkzgvd6foszKLXJg6qoFlme4BByqoGRnxpE=;
        b=SyJEw7SWADKiA5qesRS0rSL+cUnT7ZM0jwpSe6ucR7yYcrB+eZkg6M/A/bLH15KQOg
         rI2GW86wnVDG7k1O+ktdwirVYCfy2om/BVrewHSARNlGqIOq5lGGUgp0NuvXgkF2RxEK
         vmbk4VVHvUXyJO44S6eLF5PiBsG0+ZYMhHtDfJIE2KPTj0ZrBEnJ3DycTVqW/2iOxT8g
         jeQzoHT5qGNIewdbtneUFIubaFBy35FVIGFUsuLdx+VCpiKPiRePGiFtM3V2rucIrMTV
         08pPqZmiC6XhCm4pqcvnhM8RuEyC2AEJ56Wz9HfraO3kLumJDymJo4mtCYQ1k0Yj/mAE
         e0mA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UOmZq1+q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CcM0UYyPpkzgvd6foszKLXJg6qoFlme4BByqoGRnxpE=;
        b=eWpskiyBZMydQcvXPvhYl+KRGeNUa+UryW+8+2JHtgCgGTYkHFIIaN1NsFGH3g7mHp
         yr0+3HRQdIasfzUVXjiawqVyPDNad64YCCQHWBc5CybY5QT5fF/KnyB0u1oGb/BPF2PG
         /Wa8d9K9loOaKpAzQMP/xFo2RGJ15GfRCzdpFOqbupM0k31pro8B788Avx6HCriFiUyn
         yk6zX2D+Pyutr8K5EmfWEzGP1jt/yMLv8w0TOoK7//OnRi5sFQcW+uwbmVqe0P3EfQWM
         Bl6KiQMxllMW2j7ZOFEpChY8lj+oeMPM9IQPb+VlKO0kWVwzsAkDP/hg7eeH9yvJ54rf
         OyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CcM0UYyPpkzgvd6foszKLXJg6qoFlme4BByqoGRnxpE=;
        b=pHC5BkAlOXtjI4VaGrEzJd9CMMB5s2fahwXYcAlrNk7K/rLhJFGZp7A8loA9vY0yfK
         sJENfuR8uTBUyTTxQNYdxPiVNls2OXbkk4Qqfw2qMPlIf5ovTpS0LMtycGWl2//wSsCW
         /DD61ZQp6rA1MsgU6b30LpRw+J/rN2y0z7GzSn0t3mFKsa5Ee0Kxd0DRMF1t1Km85dBm
         9CWnctvJ0LLaQWMO/r9u9nzDa86LOjzkMoTIY6HiHM5fVGOhpyjaa/IW2P3TmW5AMHap
         wuVdgHEGHw2O2qmuESyf8sjuUqUy5a9AFzjvAWb7FgcLD9tiLqSdN4VZpIlHJgpxiU1w
         0McA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532InbCoMjwRcGuzWhS9P/4LsVrtHQBic+xNgmDvkQEGSoQa8+XO
	MC4QyWT8jywXY2s5ZQHUzvM=
X-Google-Smtp-Source: ABdhPJyYXEK0gtrP3GuPCJUSU7NH8DtSRPLFGYHIxv6MudFCeEQClTO1cstCaiv3OI0Qd+f+5mgUxQ==
X-Received: by 2002:a2e:8011:: with SMTP id j17mr718001ljg.444.1601360852971;
        Mon, 28 Sep 2020 23:27:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls2533896lfn.2.gmail; Mon, 28 Sep
 2020 23:27:31 -0700 (PDT)
X-Received: by 2002:ac2:4c19:: with SMTP id t25mr603340lfq.375.1601360851779;
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601360851; cv=none;
        d=google.com; s=arc-20160816;
        b=FRWoM2ddBI8O84cYVLgCE1nqORGyM3UPC21kWLNlSIvruLBRvsYf0NcLOG0xG2Gu5p
         W5GRvGF8yCGNHDrLO1gc0/F0imfWz8EKKMW/7SdT/N1HFgokB0naVTRNklnJfmawn7Z1
         8eX4HmjHbHFCXXc8+ivU078TPTrx1UHJDN3IKUOj9XSjV6lLk3G1GbsU6QgnVwpjirKp
         a0NjHcpcy0VxZiVo9NeazvjPc3A9JXc68q0I/7Z42cn/2HPkz1PyJ7kKf0atchng01XN
         Z4k0ViBmz8EDD/7vijxlHDS5V+u2h5tMGoY+Mt4dnKZtOrXOazkQflYtIIERW3xQXZaN
         Z3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=urwYS968K3ICYT8+rhgN9WE5phSCHG+ti4g8YIPiono=;
        b=nri9sNLsD0hzpPbFJVY7EjJI69YIfFENjxAb2k0d2pGAlWoZM+xZtbKm0GQILwvPiV
         BjKpF3Oi09pGcI1F1z5B1wwlYlyAdu0pDPlGaMN3poCtEEIHBeTQzBWaCkQ5zt5eabu8
         6rF0J3U3zV24pvxJJrXfgpWwp2zR7xCcdFZ5+ug3dIiYDB2VtAtY9wyeJXBQywa11bHb
         5PUmpacqnO/F3+1S3oa/04AYX0rfT2BQCqj/I2JXchHb0gbLYmG92ViTsgtXl2xIIryQ
         Q/YT4QSUMxDLwwhfQ8ILLCoQ9FU+C5XrW3mCAG9kEiTB1VF7KsLNVRg0YFyx7WrwQupT
         GrFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UOmZq1+q;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id 143si72304lff.10.2020.09.28.23.27.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 23:27:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0LlniO-1kwCoM3Zw0-00ZRxi; Tue, 29 Sep 2020 08:27:30 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH 0/3] arm-common and inmate cleanups
Date: Tue, 29 Sep 2020 08:27:04 +0200
Message-Id: <cover.1601360827.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:DPrOu9dkSr6dpTkyiC7Ds392AHRN9Zx+Bk3xhoSiWfi0MA7WrF5
 1N4gsh5t+vBPg+ousD4cH/T5xIjIYnG3YClAS3avVRNTgCpxcxCWE8h4xKeCtlx5hWcF2S4
 rMIKdRXvacH2a9hklTClqM4D8SiyEac5CFVVZ/YB+EalsjTaYrkbu5oKlLp2E8DWtZGGvgZ
 dAkheEk+E1Rd8n3WmtIqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6iWla/CwdF8=:g5skHnyLwOxZNsERvVOI+o
 3eId2Dg5ThTDxPlKMjgugR2CsOTa0BRxAoILhoGye0DBkEbflEQjzGJAYW/QDszauDm7floTX
 lio60MSncm4DskB41/qi486qVW7jKaTuFVrBhH4ESgXMxGiv/FrBmi4nS9sZODUadB7VAUzte
 NdFNlklWiNDmGK7FAPOtqE3MwSChPyh2IIV6WiXt339rv1Mh7znoK+0vS/50YkPYZUawwqJZu
 GpR6CUtendqY67QroeHAIfVoRAXOkF1ZYmGVFcWYsmunlvNttU659p8SWaDPqm0qzig/C+tP+
 nw1X/KMvUvkJAna9gquzEpuxIF3qaVfrf43e82mnkWoLimZ9aMb5Yv62lDPLCMpD2YKmn97rz
 hSBx54w3ZxJUQC92+OkBJf8cFI8z5GR02NKAcdhWx2RbXa446bYhNCc4lVF//JK47jdQB3AWh
 0+dIrElC3E7gpTbE8oqQC0CSbDE0uBfY4xsIuokBN94Ro6kOpKqEcxKqAFCunb/kbxCIct5MX
 8gdCA/rga8FsdtgqvnPtbL1SGfSWD83XvZfOdXHgkxNTrnzOD2rhnhrot/xugBDMbqSuNNrxH
 gI+YBKUpla7SI6eLlPw+lQYsgkWZBT3v1cpLc0UrqtWWo0FlXjetAgcHlrV/gMpeM+K4Sb4G1
 HZm8E0IjBtxuyZ/snqLmn3m1cvoNWN+HeN/R8kNAESNDy3WSgcvQuTE8yh1g24iiXgfbqyvrB
 i/ZhO9BzfFo9dGRXLP9wDzhojvzlJZ0Ov55Lpt0HI2eM5OWcdcMIfQEa/jkjRlZnzktHE8Vyo
 0Psp/MkMtXnjbB1mdn3FKk8N1iNWtCVuhekMnOYQyxPacMMEAQqyOe2NwPN2YKSeXcMXtXOCI
 WSzfJb7dcSzSNn4i4xqvbHICH2rbxWdc+10Oarso8tVVY4trH34HbYUow3V0Dl6/IzG5Zee3w
 twdejyxcWLsG6WI/rd0najJCjRul2ErXJopHzprsRQeBL7Gir8G598+d2BxziWxpH/hmT910M
 oIe2fwV57w5A3/DFNXHGnn9ixDL1SBcpUNyvAYub79v+/aOawDPRPJitKkR5baxCGVgiqTj1z
 GCj5DP8b7tiTL3PLfzPNTPoCVBquW+UCzjcDIrFGgfIMOcZhOTIVt72Wuy1WYdLloZATPWFoc
 G0l3lgDCkb/e5InGJh6WeQqzZB/B2d60V2fTR8t2tfSVtcR3nVKwftmkLBMnd1TumnR2WabQA
 d5X7D2+xGRar7C5JBAEea3J07kruKBxbOLXQv3Q==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=UOmZq1+q;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

See patches for details.

Jan


CC: Jan Kiszka <jan.kiszka@siemens.com>

Jan Kiszka (3):
  inmates: arm, arm64: Remove dangling include search path
  arm-common: Factor out common processor.h parts
  arm-common: Drop return code from irqchip_send_sgi

 hypervisor/arch/arm-common/gic-v2.c           |  7 +---
 hypervisor/arch/arm-common/gic-v3.c           |  7 +---
 .../arch/arm-common/include/asm/irqchip.h     |  4 +--
 .../arch/arm-common/include/asm/processor.h   | 34 +++++++++++++++++++
 hypervisor/arch/arm-common/irqchip.c          |  4 +--
 hypervisor/arch/arm/include/asm/processor.h   | 31 ++++-------------
 hypervisor/arch/arm64/include/asm/processor.h | 31 ++++-------------
 inmates/Makefile                              |  4 ---
 8 files changed, 54 insertions(+), 68 deletions(-)
 create mode 100644 hypervisor/arch/arm-common/include/asm/processor.h

--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cover.1601360827.git.jan.kiszka%40web.de.
