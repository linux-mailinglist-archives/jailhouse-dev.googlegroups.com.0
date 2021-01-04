Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZ6FZT7QKGQEC73FX6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x539.google.com (mail-pg1-x539.google.com [IPv6:2607:f8b0:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7412E96F0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 15:15:04 +0100 (CET)
Received: by mail-pg1-x539.google.com with SMTP id y34sf12449888pgk.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 06:15:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609769703; cv=pass;
        d=google.com; s=arc-20160816;
        b=UF4XAHDxPxecrVVlgA6l1g9J2JXqX0W+4Ebazft/ZWS4nuTU50zK1omok21vBph9zi
         f+6Ra8Xd6RKc9U2YmhrT4Fnp0a28cC3JVF2sN/R6UROlcoFK06ASlNvH13jezYfhx8o7
         VbQM3pum6L+JXH8Yx6WQLnJLddBtxTLQpmQvRbl/dHpfnEGgzwvYmESUvfD9dvWb/o9/
         NOo7YwDOa+nmEh/U/MRmoM8yRpDjond1N/mYk09Xs8abdnzARrf7KXwTj1t3YLGkXRJO
         fzUgmvfoqAJccWQ81z+mbIZ9BiivywfOZcpyo8MmW7R698loNnhnMtXOUPLxxdxrzXpr
         QDmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=HeM1EiIksIp6vkEnaIFesH7BGxAKg+MtkKIVox/wY78=;
        b=s7Qg400En42Zl9FGjHxzb72JoOGfy7aMd105m2VQ8MYKLdIgAKAdcON3vv8kzaPjzp
         +N0jtSpNqQUgFbW8yhuT9LgodBkyglvhnWlKK0lm0Q752AlN94A0LH1mrJRef2Qhcj85
         kBoOVlrF6H2f9d7XJF/i5k7oksPXwhUtuePuDwxzpdBLEZxG/EvtfSh1W2iQeR84Z7gA
         xJfGZUKRCXATumClrd9OZTmmqjWQkV8DYsW06JAtNF1hFjDvvAUqki9ZBTz1isqWIIPZ
         Le12isctX0Pufv6aY5tv6IyfcH0ucK6dOMqyhJjKqr8WH09SKaBPL+8h6HRMkRHiQaZD
         pNfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=hpvKqMAj;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=HeM1EiIksIp6vkEnaIFesH7BGxAKg+MtkKIVox/wY78=;
        b=MtLu6wGIOLeyTX5+rk5cjF3QoAEqD8sMk/mKoD2cVfOThGLbSgVXFZNw7ETjemY6ZZ
         aqsQcAxwkMdZo7lIPJmdSXzj5IStOK+e68waWs9sVbHwv3kL9Kg5gLhVabghXouqi4FZ
         NVFvbiYNtUjmavmwWu4pDigka8EuGXxZHsSLOSByN6fHCfDBJ+nVvb8P+lkRyooMJbHk
         kNBngicum5Ap3SzYm0mG6Nd90LpA2uWFRzAqvK/VHRNDfO6wYH3KSOkmXE/aYLq9StDn
         Juj+tJmhJMoNE6sCH2AQBqIRR+Bmk+OyGIf00+0dlUPl+i14a1HLDXxE7ryxD71CjhHo
         6PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HeM1EiIksIp6vkEnaIFesH7BGxAKg+MtkKIVox/wY78=;
        b=PQ8Z137BQs5EpniEpzX35XlfXWmoJ2bYszdqECm+O0q1sFb/WgFqlr7mn8NnuOTUJO
         ub4+UDJHqCIJu9epA5sY+ZjgbozINcx/+ZMl5pt8VTUbvjkCBTRbhDCqwwZirYhIG64R
         zbzAACO4gXFCQSouIfErqHvdezdNro9qOToZaqNlnZl4g69igNWhPw5ytjtAw5TABJ4r
         B2rCsqKwlHsAxTBTZFuGKtqTP5CkFWTVALzb/urICFCOPPHqO72KB8fTw7ELafTey8bR
         i3X+2dVvtDDGXOO4ODejUMON1SOcLVOFgxYwVCr6cAKgYUKY94S3HN4dHJvCc71EWr3C
         tx2g==
X-Gm-Message-State: AOAM532oTAD7JZNc+W3eDUu1xzQqDwmGvnZSfSC9uoVrev0i5KvUzWtq
	tSAasAqDWYstxAxv1J+2XzI=
X-Google-Smtp-Source: ABdhPJxdMpHU20iK3dY+ufg6jvdxEy6hczsdftu8g394cteJNpmhn/hoJK3fyz67PkTErSVK5iLtKg==
X-Received: by 2002:a17:90a:ba84:: with SMTP id t4mr30039321pjr.110.1609769703468;
        Mon, 04 Jan 2021 06:15:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a416:: with SMTP id p22ls18706170plq.3.gmail; Mon,
 04 Jan 2021 06:15:02 -0800 (PST)
X-Received: by 2002:a17:90b:16cd:: with SMTP id iy13mr29515479pjb.182.1609769702560;
        Mon, 04 Jan 2021 06:15:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609769702; cv=none;
        d=google.com; s=arc-20160816;
        b=t90evXgy1xlMst/p4SSQfvyt9nmPuk9gxmF0vqAUR/tw6vQmtc5Gxepx0a7HcIiQuf
         4arPdJcUKK6U7i3d0Mk4T4Ko7b506NhWCoxHmW99BMlDiDp6onr5pFVmObX/MxUhpHh2
         /tu8VBCNVn7/pC2xbTsa+EvySFAgSwBQq4aU//5nfgcXlE65kSXxo04L6lqpckeQyKGy
         JUiBPRXAkupvAu3KpEX1uCZ7eQJS5JlaEQyjzhOlb7p9iLgYiOljhSWMjgH+AJc/oRFf
         AWcoFj0RG+PT4jFy25cF/vpZNbmMbK+4DXOl0TUrWpMmlIOsFhB9rq+R/iKuFNyH7iGi
         LREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=8xLPylFgnOe60fKV+oqOuOdUgA2f0uk4NKytc/Gu7gU=;
        b=Fx4jOvf8s4O0jU50iWcjekxpmD7RxsHI3ZuEBY6TK5eVtnuxlFLE8VrayucTP7+tUs
         CRxlV4I4PK7l1TGhr0iOl6TEaw2RHwUaLriLplDxTTUjOuQupF/zrLBPQn99ilW4j+0y
         bDTD8C5ebDYT1aRN9BHX05Y53NsWiyClTmB4BG97NIksOrOEjtCF7BBkE/hiIZeCs7vZ
         J53okW8mPp7nu5uXrFmoKPDyMYQpz+eF0fI/Lga6Xgyj1xvJJTJqWOb9GWMxkOdYD4Sk
         hLWE97d91CBEMxzU2UxjQyl+RRD6eIkr125QWbmLFVOeij+4CCGWVwQc1Xh5XdnVIVle
         rI+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=hpvKqMAj;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id il4si920733pjb.0.2021.01.04.06.15.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 06:15:02 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github.com (hubbernetes-node-eaeaa25.va3-iad.github.net [10.48.114.25])
	by smtp.github.com (Postfix) with ESMTPA id 1131FE080C
	for <jailhouse-dev@googlegroups.com>; Mon,  4 Jan 2021 06:15:02 -0800 (PST)
Date: Mon, 04 Jan 2021 06:15:02 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/b93e97-9325b7@github.com>
Subject: [siemens/jailhouse] 66bd39: arm-common: Return original
 SMCCC_ARCH_WORKAROUND_...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=hpvKqMAj;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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
  Commit: 66bd3948cc4efe112778c32d70b81fd131f6bbf8
      https://github.com/siemens/jailhouse/commit/66bd3948cc4efe112778c32d70b81fd131f6bbf8
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-04 (Mon, 04 Jan 2021)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/percpu.h
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm-common: Return original SMCCC_ARCH_WORKAROUND_* feature queries codes

This adds full support for SMCCC_ARCH_WORKAROUND_2 and ensures that
there is no deviation between features reported before and after
enabling Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9325b765d1ef16af3ad6e84f6dee872cd9e553c9
      https://github.com/siemens/jailhouse/commit/9325b765d1ef16af3ad6e84f6dee872cd9e553c9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-01-04 (Mon, 04 Jan 2021)

  Changed paths:
    M tools/demos/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Account for basename modifying the input string

Seen with uclibc in POSIX compliance.

Fixes: db3391923c0e ("tools: ivshmem-demo: Adjust selection of interrupt target")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/b93e9798b647...9325b765d1ef

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/b93e97-9325b7%40github.com.
