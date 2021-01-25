Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBUHGXOAAMGQELJGVGSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x639.google.com (mail-pl1-x639.google.com [IPv6:2607:f8b0:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EC13027F8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 17:35:30 +0100 (CET)
Received: by mail-pl1-x639.google.com with SMTP id e3sf7979055pls.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 08:35:30 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611592529; cv=pass;
        d=google.com; s=arc-20160816;
        b=plUC/zuGCZx3TuUMkAhBdC1AnGk6bN5DTmmhKDb68rja+CShoY58qdRx6Gg8++UIGm
         nwAqNiqplJkl7ZpUfJF4quUv6N+PqQjS0BdSBeFjIP7peIIVndpzeGDBfAsJ7EQpt/LP
         fkLn24eWFar8aMA1ig3zElnq4uTo/5exJwvcWGHsR4PP6+ku7bnJgnxsxPaNAwj2T4dT
         FpgKr6mh1xzDWGKkVVJjXyPttUC7FhGp/ldcFAczxXAy0fdvd+ojaHKjq7ub70RoYMNu
         0gbSCyj/k956WOeaUcRD3soVPgUaDk474kXsinAQjKF6ipBxLRdIPiEXCUyKy8JX36FE
         JwFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=P8MtLja+1rvHCh5SlUWeD01YPe0kcgddZbN/3S9MN9U=;
        b=XukLOEkMB5jWkdz97SxprjdOuqWama1WGHSXF9+lqng9xgFkzfejajDts6z/T2kUTl
         QlFPvZpDp0PQnhwl6luMRiOYVUACxOgH5ljw8wQMPh4ovKGsuTMJcZDFmR06mOlVxWem
         f404RoxIHq1GoF8EUUFX9kOxb+6H7+PJ4FR0bhAy3Z09yIj1P3sZiE+6JktxCC8qj1pc
         pMHxToOSBOpUSl7tmvjCSiM+U3VDGX9gfXrxyXC4VKlcDSxgbW0Ij2t7j6wO8N/wi0eO
         T16/4Ehn0hiluCTxev2zppSnuAoBecnPRLP9Bks9FOWu4ZWpwi7MTChDEvLzVe4W9I8R
         TDoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=IzhNET1Q;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=P8MtLja+1rvHCh5SlUWeD01YPe0kcgddZbN/3S9MN9U=;
        b=ghYbMZdWbfo94qrvom2rfWhpJV2O75YQZnLN6DNGXskBAk6ZEFsM1CYrFA2e1+zBu6
         rHDYaR1i/32R+tVGfCu/k7ZyGB5K6DnLkzhPoAGQYr2ItRtYkHJ1aGSm8MltIbyeUvOR
         yRY595EI9B25EogchZnZsTr2P3/TTLZFw9fqcHsH1FbM0PA2WXX+TnwAqWSkW2g3pS1K
         r3kpFVC5xR5cQkjHJYQCScBi6d6Y1rbJ/KoFHTVIaTypxWdKxSsPvQ3N2sLs9K42H5MY
         B4BGzc8AvRSHyR6sSLLCXMm8pzT5KmDEgWaQCbY9A7RLdCJ5TTE7Iu6/sFor2m6cOhoC
         FKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=P8MtLja+1rvHCh5SlUWeD01YPe0kcgddZbN/3S9MN9U=;
        b=X5UrcR0BNyQVjqu4OG3OvqtyFbiDspFbKu/khGXR6hTcjEEWMdOCEPGyG4DVrkEE7o
         kE58wzzR5/JHOMLX7qneRLA5IImmtpXLEBvBpE2n07wuotQBOAfLUy7nUhtPJqFaFz4G
         KQB6C+2EbCBK5MPr6EeSNjrblDXlILH0/UlBoqWXOrJ/UfnawtGqYYqxieDRvty7RRm4
         sAJe6Qx4Cjd+B+SJ86Rjpj9wS2S2nLdyAEseXNaOG7IuaUX4YpbUaRKkxfkGeAtqOVMk
         oc3oJsTB+jSMFOGnrqIC1HtqiUEHf2kkXw+GS4gzyg4p/8bmbEASp5G3VGb6C/DP00iH
         +5uw==
X-Gm-Message-State: AOAM533GGTxAnEwaFMTlMzNtqEoczu15E6a0yrrYqXk09C500cDJIKoE
	pqMGf7pQ/MOb8wXgPeXafuY=
X-Google-Smtp-Source: ABdhPJwFFJ2sYDXcZ2PPke1PnyyxuOlNQC9iN6aLGbe/TCcxFMx9lHUYPGO4KRqWuNu9o6kXyPcwZA==
X-Received: by 2002:a17:90a:701:: with SMTP id l1mr1065102pjl.154.1611592528823;
        Mon, 25 Jan 2021 08:35:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:c406:: with SMTP id k6ls3127124plk.11.gmail; Mon, 25
 Jan 2021 08:35:28 -0800 (PST)
X-Received: by 2002:a17:90a:c789:: with SMTP id gn9mr1058035pjb.101.1611592528166;
        Mon, 25 Jan 2021 08:35:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611592528; cv=none;
        d=google.com; s=arc-20160816;
        b=eAe4u+IBdLSNDa75KK3oDHRDPGQnVCPKcBesrF/uLEfS81/MZExWzKrwsVgYes8ssB
         Dldf0A32fEdfBhL9ONLSDdOfZHkgSS0V5cHiPy67Vfah+ntC9rU2KARdf8Fm1dNaD1YU
         3Swk9mHowi54xfAXpLPc8vsNUxwkSVs3TTiCoR9WGycW3/2dEecai6nakrxERlX4QNkC
         trU2uKzgT5QRuA1d5xDIK/+RYpmW7VF1omLXgo+6KjmcZH1XRp/IjU8lSSdLb1fgraNO
         wWI9nap1z56WCJx/Xjbt3Wtbt7FRxuSIYBUUpxSZNTMMix32hQ/3q5Lemk8zhkkkSZEd
         0yOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ot0XOV/K/NjGi3Pf3jJrn+Xb7z/EmQb4Na7CqZqndf0=;
        b=uU3av/apCPI1NSQq/kyTUznOnKIQMdEOKnYxTZZQyO6CCmY7G1bgs6sBKANaEwxx8Q
         Wad2d7JWUBBIpVU5fPxkJXf4ehFhv3msmNwdYomw8GIUMb6qcq6lX85kO2Uf4QLM0lFb
         WCd+raZ+qQrryk2sYQn0Ncl9gHMzgQuR9tINaZQjtf9+Px9vnDh7PVwP+xk5u5UVhLZz
         GLEpGvaYoF0KquElMWLBQMthQURMX2a4Eq4rkbXbX96Sq5Xar09Px6Y2eb54yeIZDcST
         TV6xRlDaSsNaVFLx3cqk8R9gxfhBqTQrsaziERKoXBN04W8Ot8V/BA3XmTumEq6d7qFY
         vAnA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=IzhNET1Q;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id o14si157589pgm.3.2021.01.25.08.35.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 08:35:28 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github.com (hubbernetes-node-9df359d.va3-iad.github.net [10.48.110.33])
	by smtp.github.com (Postfix) with ESMTPA id 9B1F3340B86
	for <jailhouse-dev@googlegroups.com>; Mon, 25 Jan 2021 08:35:27 -0800 (PST)
Date: Mon, 25 Jan 2021 08:35:27 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/b91751-2a5249@github.com>
Subject: [siemens/jailhouse] 2a5249: README: Migrate to travis-ci.com URLs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=IzhNET1Q;       spf=pass
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 2a524906c8cf573c1794fa300aa6c11bbfbd02f6
      https://github.com/siemens/jailhouse/commit/2a524906c8cf573c1794fa300aa6c11bbfbd02f6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-25 (Mon, 25 Jan 2021)

  Changed paths:
    M README.md
    M ci/README.md

  Log Message:
  -----------
  README: Migrate to travis-ci.com URLs

The project has been migrated, just update some links.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/b91751-2a5249%40github.com.
