Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTHP575QKGQENTZ3VPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0BA284518
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:51:25 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id u190sf2741639oif.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:51:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601959884; cv=pass;
        d=google.com; s=arc-20160816;
        b=oarmQcpkXBDWe8hAKefxE1PY6Z4yUxj1O0cqKzJEGDc95J3joSSlZdHzj+ne9wSYz8
         W+YH6EbkaAC8ptsceqnjTq2lt90I/192rVXBJWIWYCAMhHUu1wGeCS6scrwdgbmosqpy
         HCXOSIhb5GpLvAfKdGXf5ppKM047vwbFEGCQAUEIwibJ+ySccnehNSe2x2ddgy4nQuT4
         +wNHYj5b3VM2RG43M0AMW7ujXIsVdfbcksSXopdcgSUJXe5xiwUdXBRgXfNwthQ7T2qX
         rZt4eqSlilUBqDESmACuUxSRtnKm9Ug8i8cgZooB0wCE8g7SGeLeKiTfs6SJy7TXLD1u
         t4CA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=/dzNv0n7BCw5iyxhwnCrueq5Rw1CEb+n7zoLT0sMrTU=;
        b=zb3mJJK1ZTE2MRvmDV6XJm1y3lrKmAtr5PSCsRkw+hkHq+0NbhsDNM97RccYl6NraQ
         okplE1Cf8Qk+oWjEyYh5GkpeO6lqiaM/AdmqTo0AsnmdMC46CLUFwNJLUy2bSSAIMorQ
         x7XVHInADwGY1UJluQQX5R4Ugbe/MlNUBoZliD/+jrXdQ7Pu+MlDV67QBMSK191R9uos
         IjkRsa2v5b92nfrFd2RyXYWpC039HAEWFkkz4pPRPx75vF1KIkK4UZ1eysyIJlqqNkbd
         2fmdKiOZHA0rx3x1N8NWlRXQiVN4/DAT1oErc5F5Q1aCgNUDFC304ZZh7hQfaA2wVy2i
         5m9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=H2gfGO76;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=/dzNv0n7BCw5iyxhwnCrueq5Rw1CEb+n7zoLT0sMrTU=;
        b=JMlNSi74VL0JSt79xOt8/+vFxCGlAEAFxkR/LYRQXwyShv/f2aYTZZ/gq1zjpWMWjH
         VhjQfNFMAX4gtAgMuvJxJY4q2tXt78D0lLOGYEjn+mk3gYx8oHrRHUPIFCeXzuZv/Cny
         8OlZZOqsV4+CDhuVtX/dUGl2zc99nvKEeom5vEtjprKzBi9uF7ekPZylE7DOZ4JAKyzV
         K/WGLFFxDy04vy+QsFuAzvPf3zG2dUwkY6+TDAqofU4X6r5QNG0XK2AKI7MMSM7raNeR
         qDwkGuPUbr2LHRlwROfGvu8hrfQRb4CpoUvVm6rDTndc/YINWJqySQ9SaKJyhJJzR8q0
         enyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/dzNv0n7BCw5iyxhwnCrueq5Rw1CEb+n7zoLT0sMrTU=;
        b=KHliiOoyo8Xpg5WEFKy1//bRjad/8yDvz33o8A/CSx8y5nS9L7wjZFZ+hGp9TPr3SR
         VGefuKPcHimJ4qAYTYwWOL4S+AHiahXv3+McoKU4lEizcekhXy361xh5ixfLQhmarRuA
         Zr0YZZDXyUmZlexiIDg5SFsPY2FUalLMtv8WdZQIYZN0fK7w+PUV8HlfinkqhUGRnp9Y
         BjzFJkWF7/NKk5fo4ovsBk8quTj5rau1CEj6F/GUTFROm2MIv4FnNBiRJ+wKFRQRxbr7
         Kaa17dbFlnlXy7hhqrMhA5iCXdZQKg2LknR9paJhBowy/lxQl4WBO/rZ8uylDSc9gr/Y
         NSVQ==
X-Gm-Message-State: AOAM532P/i0QYCz5P36EB+ZSotSAKPdWtOjL/X3dtDabs4fzHexEilxY
	Q6Na5IcbDKIfKl04AZApQTw=
X-Google-Smtp-Source: ABdhPJzH9T4IqK5QAipR3d0dMKdJkAdsKQix5ALFuz7gr1w4pFMXKsflyFETOfOKugFb74F8fmKG4Q==
X-Received: by 2002:aca:db07:: with SMTP id s7mr1732009oig.67.1601959884607;
        Mon, 05 Oct 2020 21:51:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:5c0b:: with SMTP id o11ls2945240otk.2.gmail; Mon, 05 Oct
 2020 21:51:24 -0700 (PDT)
X-Received: by 2002:a9d:6213:: with SMTP id g19mr1945877otj.34.1601959884083;
        Mon, 05 Oct 2020 21:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601959884; cv=none;
        d=google.com; s=arc-20160816;
        b=my0vLyszsHO9ac3jHDwufUL5cA8oSJoAeHM13HS4QowMdOZYiDyDB3oGw7N1JbyCJ4
         X68tjPjYLkDPMzJ/RnfUQz54wz4hqlvjoIdUtFuGMcInaJ/iUWB5EOAIn85Zgmgm6DtX
         0hE2yfNOAqnuoD6IXfBCxdcklyUE4+W+5pjN86KXLcpz/cYFoObRSfEU27ng0CgK4XMT
         JIFI4NmXyfqY6XtxVVvu8NAh6SqIqc4XNnTLXIXBlOAwzYsF3slrLYEP6rIiLhUCcxmb
         gIelLG9GNudecAI3SH/NBmw/KFphXj7G5iRCt4gNy/rvUF+Js+3/46fUNT0fGkmInVg3
         E7+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=hiLG6ldomyLz6UvNv8sI4IKU3qbAg6zRocZhVD5Twgadbdo5GdfkO/odTI2kSfPb8F
         C0T2PUTFwQDUrfaDpGFdETSm4b4VGTcflqwpYLcR7mOGxC8XMgCf/kb1C2RasmXLW8hy
         sd97w5VjbFbcy1YJyyz1LiSui0fZdJE7rdrvyxkvb4Z8YuU0wpJYXORQhFu6OAHxAB5q
         9EP4Akhkr1hPi4ccMvAB/Lf5lCALbg0iLUyu8dXtalHlhmp7nWb7yafYsmiAC8zTH3pU
         Z4wzVaEr3SF7ToW/ePONB7rrovFDWMQatRkUaZ6sSr1vWPfD8CqP7QL93/5eQdN3yfd4
         4FAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=H2gfGO76;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id k7si90215oif.3.2020.10.05.21.51.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 21:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github.com (hubbernetes-node-69895c7.va3-iad.github.net [10.48.113.58])
	by smtp.github.com (Postfix) with ESMTPA id 9BFEE340924
	for <jailhouse-dev@googlegroups.com>; Mon,  5 Oct 2020 21:51:23 -0700 (PDT)
Date: Mon, 05 Oct 2020 21:51:23 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/e0d420-e3c512@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=H2gfGO76;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/e0d420-e3c512%40github.com.
