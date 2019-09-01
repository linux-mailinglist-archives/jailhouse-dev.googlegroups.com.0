Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJHNV7VQKGQES3VHIRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1DA4AB2
	for <lists+jailhouse-dev@lfdr.de>; Sun,  1 Sep 2019 18:49:42 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id d11sf262358plo.6
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Sep 2019 09:49:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567356581; cv=pass;
        d=google.com; s=arc-20160816;
        b=fvs4c+cz7I7hJTPnrst6+FBPzldHEvQTWpWOOyILILH9aYO2+QYR+KD/F8AgiU+75E
         ZB0/yg90DNpjOAOFGTV+FXWPSPdZnuWlw0zzyh8W6nxDIG7jXww3CNzTvonH3jBqTjp4
         oDwRpB83BVI87SOZ+YqYBDORfDWGKIkKqHR60G1WCGv5c/LghvmZBCBj9JL5x8ixXZs9
         lJ/24tyzL+ahpsTvYlz7DXkZSXf4AlmYfJIiVPoGgvtgjLdK2mNlkwdyQ12kQiHefrwI
         g8Xuz3dLAeAGBD0ZPqL7j/4p1GvuDp/j1z12gF5lirgiZVTtO0AnxCB0DNwJHBzxOPWq
         ASvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=vO0Aw2+PtCkXh2RpfTcn9SCvjXm7a4ZUuOs1D21BFBQ=;
        b=RrVdRDvRWfzfkew3JCm8SgVb8FtQXlc6GhpQMRc5YvpHSzE5NMRYvMQcqcg5kHeLml
         fl9bCbZTW9RRdJ6kBZzNGU1T8vI7Xiz2SYSu2tDPKE8a+IAnN5Lb3ylRfRfcNDGfMb+i
         Qz/IAxV3Dn/xPfbHnE4k6JUQc2G13uC6WYgBA5i7r8hco0NrvGLJ40QpEMIhnPentBVJ
         A6S5YDYZPo7Ww26L8bbS36IvNYGBAO+zQGlTN+bW2zSFWZgmEJZ1g7y2UMQqJOI3sCOI
         j8mqqynMfBpM0BUHfy1gFNR85B7iNpTVBIvKhpq238Gvsa8SvVSrtH+4uXCpAEZh2EAZ
         iN6Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=HhiP4KqG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vO0Aw2+PtCkXh2RpfTcn9SCvjXm7a4ZUuOs1D21BFBQ=;
        b=XrFeAXPME6H33yG6I42oHnt+ImCtkfyRJnZGMnY5rotEZK+WKB9M6PtllgglRLq+cu
         +hB234H+W5bceo9QtwgrZ7uNVQzAMVGhfeQ3KIs3CfsiESiprR39iyqkWbhmwbM+Spvz
         evXSWvNtKL/XX5iLnG0/xuByLOXyMbIL1annyq6nO0b93evjUmoaL9fcqchfgbQk2vkj
         8bAmYrjM6Wl7ILtu75HM01CSiSx4AAG+fIlvIC5ocoafU6fopz5+uP1t9MtguXzdFMUQ
         1641XQvT7XBqctMbPozr4D3uOLXo8+8uUYcCW6+Oy3OhlZlM+OvyDmik9KFZOVKf7hsF
         WuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vO0Aw2+PtCkXh2RpfTcn9SCvjXm7a4ZUuOs1D21BFBQ=;
        b=MXjgL1r/h+83OQGuIFCPAm396qBuB+pYM2NfVq30RTJhL712eGS8ujLI+hyQYL6B5S
         SQOt1FAmMYtCCDuUlK8/TP+Qmdy3uJGSmyvICKBvbzmPvvuKSnSVOZpE3hNkTjeA2mvg
         K/XEx5BUfMKmYUH5BRxTLz0kO/nbyUeRRt3PtkK6Vgh7FmTMNk7GQ9IwQl027OtHDX1c
         +TPcwp33Bx9FuDlj7mR11WIVmnZW8H1AJ8HnSOLGR8CSaDmI11TpQC3CcGALVi7bypuJ
         V56ROC/K4LD0ZDpeV/LK3kJ6yF3tSTvvAzGP97QQ7lkn0Kx8dplLnkaPNVGmvDOObLeP
         AK8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFsm6rEFTgyJ6/eW+NhbK/Hgeo7mS9VT7MIho6mbUvRB9dix4B
	tasbOs2GO64z7xUCY9DsPPw=
X-Google-Smtp-Source: APXvYqw1mfQG+t8oD4Xe6/RVi56rCFqL2C/OMXa9M8qf3qner9LNF/g6zzFgc4oKNy+iu1lN9cKBrg==
X-Received: by 2002:a17:90a:f983:: with SMTP id cq3mr972729pjb.1.1567356580884;
        Sun, 01 Sep 2019 09:49:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:47ca:: with SMTP id f10ls2508354pgs.13.gmail; Sun, 01
 Sep 2019 09:49:40 -0700 (PDT)
X-Received: by 2002:a63:ec03:: with SMTP id j3mr22565162pgh.325.1567356580136;
        Sun, 01 Sep 2019 09:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567356580; cv=none;
        d=google.com; s=arc-20160816;
        b=PhrQiCWaa3ugTAqj60gHEdVBQZk9cQYy+AFLQZFL95aELpgD+Ty2cXpdEALnvB1+BJ
         N8iaT9Z2wXhRClDQ6d/n2/3oN6R7FILT4lFHiQi9x/o6adX4zkXzGjIdXjS7wu3unohF
         NJ60sswZoUa8SEI4pYxqED1gs7I9dkzojZoyB1+QH0CD3NpSLZAYNXsjW1xt8CzUpnCP
         3/tKnxxSwy58PiQTvkd40MjsyZvIOUjogWb6RjKkkK3X16RvED87L1Uo2yIM4CkBfAXN
         csNimKlg7+DRNg1Uh07rmwPnsEWhJMrGkTptnMXZzArMn5C5dBTdJU2WpjB/svAGV4mL
         TRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=uG1zd13P2Xp/370HVEs4LYiPIt9vVZxdcJjmFF04g0E=;
        b=IIi516XIvsRyO9efuIkYqQUkTToyU7ZodpW6qhP+74TR0fR/XGhHdisa0L7WJ0a+70
         EJGxeDtAzimrtOURytlZTontrbhrDwOe7r7BY3mF9mk16mvwyXk8bpAL1oCeRubrN9jD
         50tkPyu+dWfDAI3oO1sBtu/dtlXt4tKDFBpawI5Qw2pVlb+97mIVhIPfhvHg2b491vg9
         lc55Us55e5oWBYYscjJtbCdcYB1iHp8/yfQmn+tqdkTeCqC9w5Jyw9ir0ht/vPZo7OXX
         Pi9j9NAT2XF4wGpMErtY4KFYvI8grRQehnR1UZgp6ERnqo5LNJVXOrT5oyAHb+JKJHdG
         PDvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=HhiP4KqG;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-13.smtp.github.com (out-13.smtp.github.com. [192.30.254.196])
        by gmr-mx.google.com with ESMTPS id e11si605885pgs.1.2019.09.01.09.49.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Sep 2019 09:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.196 as permitted sender) client-ip=192.30.254.196;
Date: Sun, 01 Sep 2019 09:49:39 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/aff3c9-ed7c7c@github.com>
Subject: [siemens/jailhouse] ed7c7c: ci: Update build environment to Ubuntu
 18.04
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=HhiP4KqG;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.196 as
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
  Commit: ed7c7c2e61d9010ca812820488fcc8510ab3ce16
      https://github.com/siemens/jailhouse/commit/ed7c7c2e61d9010ca812820488fcc8510ab3ce16
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-01 (Sun, 01 Sep 2019)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  ci: Update build environment to Ubuntu 18.04

This gives newer compilers which may report issues earlier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/aff3c9-ed7c7c%40github.com.
