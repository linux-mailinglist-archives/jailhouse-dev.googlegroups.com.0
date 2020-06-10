Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBVOOQH3QKGQEODIADPA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6BB1F4CA3
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jun 2020 06:53:42 +0200 (CEST)
Received: by mail-io1-xd40.google.com with SMTP id a16sf801579iow.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jun 2020 21:53:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591764821; cv=pass;
        d=google.com; s=arc-20160816;
        b=RUseL3g0GmLolzJJecE/q4zCiJ5DBhrgMuXoqGru0X2VCkCFVQXQkhc2aixrNMoyF3
         Bi+upuBQtbFHrkBX54hmSdiLdxeF1InOKFsoRvFlNcsfOTXf1fn1++B3kNUJqxCpcPi0
         +l1ta59yuZMrVGgs7swn8kQbDbvWf2Al42giB4gZrj6gC/8Oo0Oyh5kg5NrfYz2aWiVu
         liqW579G70hdqFjtxQG1UYR+U2vlW64Qp9LGm3xAABfmCQ1B9PYbllbahtm7kVBGU2mU
         KL1QXDst18c92M4FCxwX3ARbIUO0m309HgIbIsSxlr/NpZQ4wpW9F+yguSswyV0z+n1j
         +WLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=75La62rxHendORXTWI1NnclKiEQd6/SzulPnv7yawUY=;
        b=d0jEoFMRETSleqpNRSqu3EIA48hOmPc8F2Qh7cBS9B9U52St0irthUmUWI8yBuoE/A
         cB9AAYqXZjAkaAc00MlK8HKhY784IxJmCcJ6QioTukcvY3G/j9Yji5D8vtyptORwywbh
         dyGy7Y5xOZ+1JfM8Zt4HRhb4YK93w0wT6/C4qO/j338ymCn8iJ5oSJBu8mBDCRUgjurB
         fT4nT22OktlwlbY7qzHk2dI7Imyh96/+tALeq+kE4JXAROipQkub0KNYAFSHHqwWI5in
         9xwUY9iMBzU/j8oOo6H2MJu4Bj5RK/6Awb+zEWL044XsKeSMtH8W1FpRKCmgboH4OaIQ
         AymA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aRSh0zuX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=75La62rxHendORXTWI1NnclKiEQd6/SzulPnv7yawUY=;
        b=J5QYxguFgNBTxxjpag9wCT8rw4wVCc6WHpfF5NUlkib9se0sRE+CKWeq0xtRaAFUp0
         0uk1gYfWUfE1jraJI3ZjwqN1lLGzQSOMpN8CQL75zNe69y2bE9AbujIvzz8z6SWXD2RF
         phQ6AF46NLjniNKAgXHeFohaHunsXUpBsm061BrSgd5x8Py3G6EvZeqMbTW+VZc61OT0
         vth4jTDgE2KzE9oyVxuGVEFUmP903rOqC8VRRguLNmV47fqvUX6zGTqqgMFnPtTOaKEp
         uZxz8GgZ6nuaNHlgLh5VXVBxPT4GaaFKKaIpHrPgv5fogczFm58UAH5YIBuosXM7TSnH
         Es6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=75La62rxHendORXTWI1NnclKiEQd6/SzulPnv7yawUY=;
        b=e2S5E7gsVqtpkXJ+lWjGa3RWilTOk33cP007DEXZtbXbI90ZN3c/1lm2OtkC37fDkX
         07tsnMmH+DYAC9JYiV8VRRtv8tZrsnZYc5jgdvSP8oLmMdqZ719u55BXChQz7HT+TX7W
         8g6TGZBn3Izb1XqL36VXagRKiB2eCBTEzqNP6bWxRJY9wnGoSQtM3KhUbECqce+NEB8C
         P0he+ZXI7znkwgbA8pXEcothU7ZzgzjPf24wgo6uyFJeN3lTSLgn8O/adEjEQy1vFbcR
         j7KBxGt68y2s8024xBkoJ/EisVAHxIr7RhFe5OxiDBVqqGZjNSfwjZFzwAWDzcY4Wfzm
         6Opg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533VBvDpbN6BmgOaEpTLoLbBiBynT6skZkdcak9nh1CaBnkZDZz8
	hnZtKRxa58khPc4k9PcgFag=
X-Google-Smtp-Source: ABdhPJymOfc+9XsbKDl/OSBDlHx17mn1BQ4a1Rwq0HPdggicEBLv8wD6jeuDlVXhK1uAQ5WMYKcttg==
X-Received: by 2002:a92:c852:: with SMTP id b18mr1414577ilq.224.1591764821761;
        Tue, 09 Jun 2020 21:53:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6638:113:: with SMTP id x19ls884519jao.0.gmail; Tue, 09
 Jun 2020 21:53:41 -0700 (PDT)
X-Received: by 2002:a02:c4c8:: with SMTP id h8mr1544545jaj.64.1591764821233;
        Tue, 09 Jun 2020 21:53:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591764821; cv=none;
        d=google.com; s=arc-20160816;
        b=a/QJD8D2kX5KfwEMrFn9/echR6FFenXl07Twhem6YIKHQb8uvE8HTgzWqXCpagkIbe
         skkS7Ba15C9x3s33uQuMoz/M1OA+lLrtzUSmKDBkgZSLN1lhNAEk+dDqgG/N3V20ufy+
         ci45dA1oOBj30Yq2WdoXNMlJO/Q74xjmzu6of1kSl0//Cg/55KbW29FTPhk7vn8Q2Ts7
         IyMJb4ibjda094ifYVTQofokIzBfMarTPlJdk2+1G7YLih7mhhnXlfzk7eCMRJedWXmj
         UT7qMb8LdS++aBVWN1pZyPCZXWPSu5p0MT/11KUt7ig1PkKuDst61aRnw5dm+ffMMMxc
         YowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=x5kK9uhkicKDP09X9738eI50Ssy+U4cRP9HLnvi7moI=;
        b=GtYmBz+/8QFoLjJPW0iFWpCQyOFKjWewviq24X1X1C/amml563T21voZkBGnVtzoU1
         vnqhBrc/S4XXIsVhxM5JrgA7zinFmshQDymXULnuJK5bpxNwtT6iuO7qQALybm/CPKks
         dID4rVq2C54R/q89cnVmJG6jTKypv9VZD2IUpLGk67lhyiAYGivDScZmKuVReCZdpiNx
         A1gXv0n2WSx8QqeZ1dI6ubeL9lB8Hm7D1g8YnqjeYLNgN5allGGFwNSWUPrBLGYggSVm
         N/LfJtxvjDVuvBJZ9gtKenVDytGwdpcAj6dfHVOJ/WlviHcORfMjT5km3C8qAY3+j28a
         1Tnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=aRSh0zuX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-7.smtp.github.com (out-7.smtp.github.com. [192.30.252.198])
        by gmr-mx.google.com with ESMTPS id z17si655254iod.1.2020.06.09.21.53.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 21:53:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) client-ip=192.30.252.198;
Received: from github-lowworker-c5134a3.ac4-iad.github.net (github-lowworker-c5134a3.ac4-iad.github.net [10.52.23.55])
	by smtp.github.com (Postfix) with ESMTP id DE85F2C0BD5
	for <jailhouse-dev@googlegroups.com>; Tue,  9 Jun 2020 21:53:40 -0700 (PDT)
Date: Tue, 09 Jun 2020 21:53:40 -0700
From: Andrej <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/4ce765-af4b5d@github.com>
Subject: [siemens/jailhouse] 7487e5: pyjailhouse: config_parser: simplify
 signature checks
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=aRSh0zuX;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.198 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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
  Commit: 7487e55930f76b644fa88bd0283538eed4c48e41
      https://github.com/siemens/jailhouse/commit/7487e55930f76b644fa88bd0283538eed4c48e41
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: simplify signature checks

Just a slight simplification, no functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9f0aa69fba6df236baa4c6b2a90c7e2a92be8162
      https://github.com/siemens/jailhouse/commit/9f0aa69fba6df236baa4c6b2a90c7e2a92be8162
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  tools: jailhouse-config-create: Improve code readability in template preprocessing

Move lines with similar context together and add some comments.
This commit serves also as a preparation for the following commit.

No functional change.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 91fbc4ff25965325d8a75b2b568db5bc1df38f42
      https://github.com/siemens/jailhouse/commit/91fbc4ff25965325d8a75b2b568db5bc1df38f42
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: jailhouse-config-create: move PCI capability collector from sysfs_parser

Fixes generation of unreferenced PCI capabilities inside cell configs
on AMD systems. They occur due to removal of the IOMMU from the PCI
devices list after its capabilities have been collected.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: af4b5d431a5147b059c9e1219834931a91319379
      https://github.com/siemens/jailhouse/commit/af4b5d431a5147b059c9e1219834931a91319379
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M configs/x86/f2a88xm-hd3.c

  Log Message:
  -----------
  configs: x86: f2a88xm-hd3: remove unreferenced PCI capabilities

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/4ce7658dddfd...af4b5d431a51

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/4ce765-af4b5d%40github.com.
