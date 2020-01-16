Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBEX3QHYQKGQEJHHNQXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1413DE53
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 16:13:24 +0100 (CET)
Received: by mail-pj1-x1037.google.com with SMTP id h6sf2080315pju.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 07:13:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579187602; cv=pass;
        d=google.com; s=arc-20160816;
        b=inULam342fvhGgGlebYsnVc01BH6u0hAIIgHXe5omVVETfgKQFqOn8AmWBODHYZBUm
         44lg56Sdd2mjWwjqKZgJ60pm0DzDQ6FmmSXBICGoD8+o0qgIH8bKr051TJg2UpHlutT2
         /XIm1nwx1M1w1SgpR8fu7BXy9U4ZxgZKU9HrSPHzn+vSNBSaUl6tytbZiqJOIYzBUTF8
         FvCzWB1N4d2YQ9nnl2zVtw5Vm5gjAfg/o5AOSQGBfpi+ASg8g4Zlk6hanv8xmRHIGR/D
         bbPujGvk4kxzDSgBywKbvqEyhq+pWE4lVoVjyz2v+nodxsUduWGAaBe0OGTGTDbidpMe
         h6KQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ePPkXV0PObvnFZ7pxMJDeFdDm/LoJ9m5nhPYMqPZ52Y=;
        b=gR1QYkuub1wBsfBZ85CSTM5jZk1NmjFHyw/ZFFVoxOjcg+WKy1ovgtu/zFuVFV6bG8
         0KYgLZ/81TpIwzM+06n8U5Navw8RFyVD2JE4Mls3RHH4FQcHS60tGGed5vIFOQcEzxWV
         nL0JKXQuHzX/2sduDS9rg+mHhpdLNpk/xqfz1QWCdgMGxRCFBCUzpLzrNeCDbuc+6zDG
         HuKb8+1UsYeF8PfovmBWNyfEMMG7Gy+5iGVQUc3ezBySNd1A0Ck5wSfDq6iCYyOkQE7S
         Mf4Fzmjbgutqc+pmedje9fxZPwBViRIHv/BOEdpeeC18QfhbhKjMO1YG6mcw3z6424Lg
         pmBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=E5ebo90y;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ePPkXV0PObvnFZ7pxMJDeFdDm/LoJ9m5nhPYMqPZ52Y=;
        b=gCDET1wDlMTcw6yH2AUDywYPYhNDy+gFQLr6ENtDulvLHM3YStWOSP6q1rwqhAfmRb
         cJ2n7xwdhScLRp/4GCXGIhMa4wB5MFJhYQfuCKifLeRT8To/cKuWF69RoZM5Q3WKSqe5
         FceUlaPX6Dwv+atEUmBzoUQ301klzk95RkHYlWa0qB9skOkvaisg8YOUmsnmmZYrNzIi
         sm/39IS69qXF2VDKSU8yvgeDgrFAZY9MMkBOpAC0AhkEdDZGPhujr3BE5okbyr8JBiGE
         CiB8F9uThjTidamGhyrQPVicipVGd73maBBDsgK+dKAoKXpcmUuTKZjZD5oK5CMiD5gu
         BMcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ePPkXV0PObvnFZ7pxMJDeFdDm/LoJ9m5nhPYMqPZ52Y=;
        b=Eq3ZePJPqfT5MZWEdwPhQtQnHcYAJzpXvyg11dV79mP9BpVlLFe9YYujYTXL5akMrB
         pV32iPdUKkNtjur7t3oIBEzJTHuROqpWZRcQWE4HxIpnoSkKRmbDBel1KUuwrNab4amf
         WEHFs5bv3IlHYHSC7IA6dQKAZiKBQRyG4qeI5tbZFVRBtNUstoB5UdWda2qnR1xZR3pm
         X/pJ9yUhbeUkUUTX92dNMMAvBw99Z033RrsBb25UB1N4X7E3Qff3Q/Ax48mqmGViHY1/
         M7/za3vMdJUuKpfr9N/3KxzXAqHRZv1A4qMvD7xoZag8QmvXvamKecqHWtMJKU2LNTc4
         FSqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVfjnyg1a8+swj2q1HVKsLHjbHs/CNDnZATgjU/HgPSuwL6Qhab
	J+Ugop/vot+wRc2Mwm/8U6M=
X-Google-Smtp-Source: APXvYqy7L3LEM2R3KhZb/fT3wH5OgevnABsYz4Pe2kj3KaS8sTwnWZnTmJJsCStt3JqY6PcUDgzwqw==
X-Received: by 2002:aa7:8e13:: with SMTP id c19mr37937880pfr.227.1579187602828;
        Thu, 16 Jan 2020 07:13:22 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b789:: with SMTP id e9ls6125707pls.4.gmail; Thu, 16
 Jan 2020 07:13:22 -0800 (PST)
X-Received: by 2002:a17:90a:f981:: with SMTP id cq1mr7365099pjb.1.1579187602231;
        Thu, 16 Jan 2020 07:13:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579187602; cv=none;
        d=google.com; s=arc-20160816;
        b=jTzpYelGPccBer4LE0yli9GEnZloULvfdqnYGqu2+NJcEPjmSTBLsLc/GHLpCClCbv
         DPAJd31gYMS4LIsErDhNeLozinffEt7AVvOETcy9rhUsGu8rsAfNCnWH1kLdttENnB/4
         tAqu2Ieut6mKSBHUJAVUB4tmEgpdPn3Si3d8nED+wApq1QnMb3a+a0G9KMhc8HyWBXkA
         PZ3IWlqzTj681Altxny0zlX5dyaHykviXqOIKbf0wmuhsRUp+KB6Msd+iEyAl1Lwa3VG
         E/3E+Fs4lksF4kAEUelPRScKN/8O65JQXgt3tdSATZKVYHK1VVsNiC4fPf5X7DWTH4Ov
         Ge5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=KSN9ccmDT9gMR89C9s+YokJQyLlYK1grwL2PyThSEeY=;
        b=yIJldGQfEeW7vRgRAIY7WehoFmbYjDO6AbM44dZlHRPWL37sRAFfQ8HI96Fs1QAhi2
         RY+FNRegs8Sq/Mi4F6a5V40k0iKKMfeiU1TD26byk2rL2Ig0kl+ctA8z1jMl93Vx1H56
         IVbUiKPVTIAOHc6wIFL3gcShPwMi/tSR6fzSF1glT5TLapGHQM1tUIg5kTBI3420Xauk
         /dsxyXnNNw9sd6IKfmDWFbNLdQKceLKXkDeEwHkpu/j26fv42qN85VJuprq5n369GWlN
         uEtd5xNSi3o2H0iEvqI49Y7IpdxABAFFbw008jkdkw6VH3BssG0WXmPYcXZ7fVUAG662
         TYkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=E5ebo90y;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id cx5si89113pjb.1.2020.01.16.07.13.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 07:13:22 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-25680bd.va3-iad.github.net (github-lowworker-25680bd.va3-iad.github.net [10.48.17.61])
	by smtp.github.com (Postfix) with ESMTP id 6867B6A110A
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 07:13:21 -0800 (PST)
Date: Thu, 16 Jan 2020 07:13:21 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/cf0d15-f27064@github.com>
Subject: [siemens/jailhouse] f27064: arm64: Fix initialized return value in
 pvu_iommu_c...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=E5ebo90y;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.207 as
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
  Commit: f2706433efea646a7357cc399de9b24be6253a4a
      https://github.com/siemens/jailhouse/commit/f2706433efea646a7357cc399de9b24be6253a4a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-16 (Thu, 16 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm64/ti-pvu.c

  Log Message:
  -----------
  arm64: Fix initialized return value in pvu_iommu_config_commit

This is relevant in case there are no stream IDs in a cell config. Found
by Coverity.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/cf0d15-f27064%40github.com.
