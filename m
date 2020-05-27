Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBXF3XH3AKGQE5JMVWAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3b.google.com (mail-yb1-xb3b.google.com [IPv6:2607:f8b0:4864:20::b3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24A1E4259
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:32:30 +0200 (CEST)
Received: by mail-yb1-xb3b.google.com with SMTP id d69sf20309529ybc.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:32:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582749; cv=pass;
        d=google.com; s=arc-20160816;
        b=iiN4za2Nfux/skQBTc9Iv9WVdX83LatY+0hJRKOV+FFF1hbgFjoRC+lE0ZmrKSmh4I
         YM4FzcodMNqDfEaTe4JMD9MX84Ce9FFrpMvcyybFsRPmW4X+HhCl4KHDrG13KjEzrhvb
         WtP51jtsb4N4MYjocpqW199SO3MDFLPK6QnBLRLo3tvzTJyeanSgz0a4n5RJn0/X5P4D
         3VMSFPyh0HszPTrftTclpffu4Z5wrCP9ZrjxWV8QcdBtNLb1aAygsYjSuMNm5FZKDQky
         yUEqQnifUlEhz17fqOMtySujEE9Y6zse6dce76PUO5V5To1iPu79rCPCRlHhSOxiIomd
         gFlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=BUI1DaZLKlvP9/TehNaedYZavFQwnhgsVtWaJkxeLXk=;
        b=HRovpWA2Sw/CDRzrZdr2Hdk3Z8O99Y4N3yjt7v96LWEgbMurKTtE5jgbhqk65+MZ9x
         W3/eI5uI5u+hFt5YT3cqs0RvuxZOdMnclhXUaiyzaWTBeymatMkKbvb6PkDdLN8rN700
         aJtzyKP1CiVLl7jZjmZJ8Lg2YnmZzrThIfG26kBm231zEzisUgbLc0A5hBEAA6FUaFZr
         NWXX83+WH3ay0VTepnk1TTpC+5cHd3h2eZ1CS0e6lhhSBcP4aIwKepggaVeUpNeXm25O
         oGYMlozu06KHeDOFiT4ocEmsCTmdU37G5IRSP+K5s7eCGmacW87DI6GkiE4Ik1Qin8B0
         f7jQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nyGNi7xY;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=BUI1DaZLKlvP9/TehNaedYZavFQwnhgsVtWaJkxeLXk=;
        b=ssr8lEqr/wuP4HZjxwvhJIb2t5oHqibJPQOfW+7G7fJ7iasheNVoSnPKLWwwZwXa0h
         4WTIxlmkhyYQyh+OQRjW3flnKZYBvzPObumZoc1Vc8t5own9i9zH3TttzxzrKrkkauAI
         S4XHnETi2tdOyiwiq87xS5pVvHeAqdqoxvaOnyjv3iXYGc2VkklIimF78sYL2e+rmIJu
         zYMx1AruAEM6lgZhKENAA0u613MF/cYAJSUWdlCRK57rGN3NzSMF6VILLlj+6Ic/y8UH
         V/0leOMKizRpXyetLJdUjkKUMRCv7j6nQxJF+5m+6YiGv5U/wxGRBgow4sBxJT+vq8cY
         DNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BUI1DaZLKlvP9/TehNaedYZavFQwnhgsVtWaJkxeLXk=;
        b=TNeWGejlcQbIgJCZRHbE+5oNCA7YoAYk5mB8ZTt6gNbroIn3LejUTLVwZ8EJbD04gK
         soP7avK4xF5XZ1+8Gsn/ydVUCnS8cYFPpdlmKzK92jsI4g61UC7sGlF6XlJ2QuairL0+
         S9x02LK3pCZj4SL4biRPADpzL9Yvk9l/s+OK+mcO5TzrRoELgFuthgTLy6cUVSRRSPav
         hSWa6KBrbE8/aJzkwyvq0kR6ml62m4HgmQRr0XEFg6x0IUpkZh0shFek9KDFi0l6fQyM
         +N5pq3fG+ttetVavCam1sHf051S/WafDgKO5ybEBVNV2zE71nLmSeeS3PwU6/1LDzEpy
         LtDQ==
X-Gm-Message-State: AOAM530IcKvZKBCqPAQ9vcicLHO4DTqvue3PeRJGOFLFfeqtt+TOpSg5
	lWdZOeW/tPxhTKKuJSAoXkU=
X-Google-Smtp-Source: ABdhPJyiAkX+DtZVOzvkS4edqy8Xpb1QonXQ/RT7ol/KfXKHeHrXBbRNaxnF1QtTLBKAhSn1XttIGg==
X-Received: by 2002:a25:f505:: with SMTP id a5mr9323251ybe.195.1590582749012;
        Wed, 27 May 2020 05:32:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:41c6:: with SMTP id o189ls5437131yba.1.gmail; Wed, 27
 May 2020 05:32:28 -0700 (PDT)
X-Received: by 2002:a25:e86:: with SMTP id 128mr10220033ybo.344.1590582748411;
        Wed, 27 May 2020 05:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582748; cv=none;
        d=google.com; s=arc-20160816;
        b=XuE9zybIViIx4Y4s0CSBnAx5Z+gQJQ+tqfBb1yctD8lFrNXFlJH6RfyYyX79edkVVm
         1irEtHvrr3OHCAXFCLmr0gAdZL9czrq3yRPtvSKzxK0NvWlCWeBRvx2PQz0PvcG1nGiS
         /NsuVf6ObgOnOU3k0FNX+mK1mXZZF6A2I+yxj4Hxy13rb9EHJHipa33mlvxIhq9fSlkY
         KsyedW1WTK2M7HAPVXRbRJDrCQsWN12/DIx46f/Or0zNeZb7TP7SkPu01GVXGQvoyeIk
         dg3703igTK9NLOHbvbfFko5RBrsoRzWIJs3tI7Z2JMFaRI6hOax2/dMM0acV3qWnurPT
         0nYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=kwmMsOYB+yd1XUVqCRUBoK4ikf+kVAPgwM9jcYLQOVQ=;
        b=ystsU9MSV6dGRZaWBeC9qfN06Fi3KfStm4nUYTGX9U+U7IurkCxbZixlFl2ILbz/Qu
         rh/3GQumla6Ecwg7FkPi460Ip7gRKcefgB7FgaK4ZCD9RBzAKZic7duDfbCoPX4Kn2Hr
         Xm9ELo0kSGy9D04TJMWwzUWVssrKW8WeMbVX5nn0q9Oap1pBi4vCWnxTF0DpiJ2xcfGX
         FXvGmKVGubMU6QjQEhFdyKcQArTk8UmchKKIUbodqImkw2DA6AO63+GkjnmXL2zg1CDw
         VOatc/drti/z+Po9LS+R0VdMUxyOapDtstTxRUBzGJgqMpWSyud02JWW42ZY0FyqKP4X
         I4nQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nyGNi7xY;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id e127si197747yba.4.2020.05.27.05.32.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWReC124510;
	Wed, 27 May 2020 07:32:28 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCWRxt123320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 07:32:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:32:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:32:27 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCWPj5096152;
	Wed, 27 May 2020 07:32:26 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 0/4] IVSHMEM support for k3-j721e-evm
Date: Wed, 27 May 2020 18:02:21 +0530
Message-ID: <20200527123225.31726-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=nyGNi7xY;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

This series adds ivshmem support for the k3-j721e-evm platform.
Modify the inmate-demo cell such that baremetal ivshmem demo
can be run on it

Also, generalize the current linux application to be usable
on other platforms with different configuration for ivshmem.

Nikhil Devshatwar (4):
  configs: k3-j721e-evm: Describe separate IVSHMEM regions for demo
  configs: k3-j721e-evm-inmate-demo: Add ivshmem capability
  tools: ivshmem-demo: Map memory regions with correct sizes
  tools: ivshmem-demo: Pass peer_id command line

 configs/arm64/k3-j721e-evm-inmate-demo.c | 63 ++++++++++++++++++++++--
 configs/arm64/k3-j721e-evm-linux-demo.c  | 33 +++++++++++--
 configs/arm64/k3-j721e-evm.c             | 33 +++++++++++--
 tools/ivshmem-demo.c                     | 62 +++++++++++++++++------
 4 files changed, 164 insertions(+), 27 deletions(-)

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527123225.31726-1-nikhil.nd%40ti.com.
