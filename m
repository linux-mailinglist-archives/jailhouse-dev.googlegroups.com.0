Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBXFKY7YAKGQEUKRE3TY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103a.google.com (mail-pj1-x103a.google.com [IPv6:2607:f8b0:4864:20::103a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7459A1307F4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 Jan 2020 13:23:58 +0100 (CET)
Received: by mail-pj1-x103a.google.com with SMTP id ie20sf4370219pjb.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 Jan 2020 04:23:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578227037; cv=pass;
        d=google.com; s=arc-20160816;
        b=rfjSmjUJ/QmzqXTK4NFsJvnuaRY4v6hiLC4kJ3PFjY0eWC4muJ9PQmVd18kdqibCdF
         Km71qEKefR+F7vbhTBRJawK7NI48ZIfsLiKbpAi0r5N0TKYsrNudsdhr/Rkm7YgVVZBK
         h/eNk6kBHhFsjLAclFWvza0tfGBW0jktuXbU34PH2oB+Tixqz822dOmw57+BaduHkux7
         Ghlbyh+hXp8RZXsYAdsAXV1uVU0MOJMA1oHWfOFah47Y3HIfCKCAsfV9clO5/TN9dx9H
         XCAAzQ/U/Bh1ujyDlXeQLrBDTgsXqn5V0ooFRCVIYju8J2gNOe3npHG44RBji3iajJYF
         XSww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=QBXl7MMstAedtDLilnefk4f5n4R590np7reZ3rby/Fg=;
        b=LpfqKUc3vKGLdjBudqXriF3oXtbf0+P0qDIvMZ50JXfkKehwwxqt/jbx0jpm47RJHk
         Z/OKbtC+MjYz7o7WMME8VdIzwXG/oXq6RFBQ2Jq+OHZk6AcckoSmfS2r0cn8LF4gFy9H
         L0Sjp7iC7znQ8FMzUTFq+1MMsKCEOgacQNAG/BTYu9iGrj20rGo2w8H5k1cg7NA0Xpby
         7Kuu9IP9gQv6ZuK7UP4UkzBOPtF82FsrLfxeIH8lIoWX9rLYNd+i3ahInx734OWtlsfs
         h5hZvl3iKhBqoKUamqhFw9kKYrfKOwTdYzIlTy/1pVvEL031hqhvFGuqB9EpPzhHJ46S
         KUcg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=izEqE+8g;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QBXl7MMstAedtDLilnefk4f5n4R590np7reZ3rby/Fg=;
        b=a6UpvPrN5uLjl0wjGoU3/rzvPnYFjhrdum8jRpp2LVg9+FVbiLEWPmIlGo+zsle+3Y
         dIeRkValBdKZWopeOVHNxlrEHOi74TLeX2gMN0xGjDpf7ACYSH5G0oV0VWk8Kn6n71iP
         Mf08aQPIUiNoV5UCn/RyCxl8k5C+g6OZO6cjd0nAnZatX9f/nIDSHZtTdS0CD5N7JcGH
         CszaAhjfRddAxp4SlGp5b+l6YR+DLMFNeQCxo4dYeGg7gM8jtzJHoB2nscKjUwGfTpDw
         +4sf2lrS2B1tygOzje4me2p2ZsuXzFnnFyE5wEqd5uUBbq5wKempk0orWX08LIBI0b7j
         bikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=QBXl7MMstAedtDLilnefk4f5n4R590np7reZ3rby/Fg=;
        b=Vch4hx8jJknwIXbY4tupZse5SYoG3k2yHB17zzdgkSvBzg3ZgQ+7JdMJxpsd5pqJeP
         3FUtPcjYqfh88rp3q+vX/KTskWqD4Y7nG+l7KQ/zqnI8xNKKViRyy417Ykzz190pBcyH
         9K0AKd/yuYlXktVrk5btxAC/5mIjzBL+hcd8MXO4ImBgx8luCzNiMx+aAIQycXTuzu3b
         zbfaCRXKYDJ20747efZNrbsllHS6dUQSMKtLzFjML+pX1D13TsVliZ2ua5lTSMg7RZv+
         EgEPs56ErJyyFxFs13RxeW53hhmDVooOMHo7bB+zBTLrIo0Ir4tRK9m9tvqFcEdTK1Wf
         FMoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNpekN4WMcZsvCFVa69hx+eYGxxvLxi6Hjwle+dqZEAoH8RJJu
	qI7Ec+npRU3WCwFutausswM=
X-Google-Smtp-Source: APXvYqwZe8KXIA894LRy5KPq9y6HXil+LCshZTIQpZs92uVNrCh7GnAQ3iGBFfE7qRa+qLLGpcMBow==
X-Received: by 2002:a63:4824:: with SMTP id v36mr105856278pga.343.1578227036792;
        Sun, 05 Jan 2020 04:23:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:4608:: with SMTP id v8ls14152931pgq.8.gmail; Sun, 05 Jan
 2020 04:23:56 -0800 (PST)
X-Received: by 2002:a63:cb48:: with SMTP id m8mr109135060pgi.128.1578227036204;
        Sun, 05 Jan 2020 04:23:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578227036; cv=none;
        d=google.com; s=arc-20160816;
        b=cD9NCgCnbxOMpmiGp9BZ0ZBosLRjXkQc90j6PDBN6qWJxQCDKQmivx0lsZeBAieBsq
         dOqPLJUbMggWJdJ7pz8BkL+7LIhixU7oNQCSdIWlWK/J2hFeT0ozeuCmGm9ytL+i2pVY
         BZPqXUWkkp6B/f0i49/XHHXxQ5C7q3BLqhp+TOp9qyl9PSOcRpvuV5JQrjKrL8HilPrw
         OR7De9MV2jcR7lJLaefLJFND2yXPSsImjN+7230U1G5NxNlDJnPYLZTgy0xx3z0KBSaD
         G6kuSH86hrba94m3eB4w96+gSYyUT5569UQMiLeCIc4c/l8PqCqZzLjyVxe7Ix+yAkM8
         XkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=mGQObmDjCZ4q1Gn39sNf6RQV0CYilLKuWTiVzbSShsI=;
        b=QmSpN4ThLwF5z32yKSAx0/nJdVHgD2QI+BqQ501OFJQTZuETDxyEl4DuOpZuP1ayr3
         uOi4QcuI797fPzRT7slcbib1Aqt/ZGyWNYuskKESfyNG6Xa7cD/ytr1rqTYam4myo3Ud
         deq9jotjMH+hFciycl65VPOpZtvT6FbgIQpCQdCKrXszrdmkGho96j8N8KjdN05iHZrm
         yysapkqvVJ9dzqPY1PhcSSElvtH+uwyaxXTimWzz6hoIuEnYvkvI6bwShr8LsLHUeWA+
         tUUYp2yQxu/DdYrYF0yI8nfctIK1tqyQVBeCxabZdARLqImsf+mVtaxl6MxoyjLT4qdm
         jGgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=izEqE+8g;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-4.smtp.github.com (out-4.smtp.github.com. [192.30.252.195])
        by gmr-mx.google.com with ESMTPS id d9si2051308pls.5.2020.01.05.04.23.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jan 2020 04:23:56 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) client-ip=192.30.252.195;
Date: Sun, 05 Jan 2020 04:23:55 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/9f6963-383f33@github.com>
Subject: [siemens/jailhouse] c50323: configs: arm/arm64: Remove uart demos
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=izEqE+8g;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.195 as
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
  Commit: c5032307ce24b243cc73fe19ad9a8de3e8edcf72
      https://github.com/siemens/jailhouse/commit/c5032307ce24b243cc73fe19ad9a8de3e8edcf72
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-05 (Sun, 05 Jan 2020)

  Changed paths:
    R configs/arm/bananapi-uart-demo.c
    R configs/arm64/amd-seattle-uart-demo.c
    R configs/arm64/foundation-v8-uart-demo.c
    R configs/arm64/k3-am654-uart-demo.c
    R configs/arm64/k3-j721e-evm-uart-demo.c

  Log Message:
  -----------
  configs: arm/arm64: Remove uart demos

Those add no value, compared to the gic-demo configs. They only increase
maintenance efforts.

The emtrion boards only have uart demos, no gic equivalents. Keep those
for now.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 981f0ff8d4898c5f1f65ede7e7ae6a559b983aec
      https://github.com/siemens/jailhouse/commit/981f0ff8d4898c5f1f65ede7e7ae6a559b983aec
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-05 (Sun, 05 Jan 2020)

  Changed paths:
    M Documentation/setup-on-zynqmp-zcu102.md
    M README.md
    R configs/arm/bananapi-gic-demo.c
    A configs/arm/bananapi-inmate-demo.c
    A configs/arm/emtrion-rzg1e-inmate-demo.c
    R configs/arm/emtrion-rzg1e-uart-demo.c
    A configs/arm/emtrion-rzg1h-inmate-demo.c
    R configs/arm/emtrion-rzg1h-uart-demo.c
    A configs/arm/emtrion-rzg1m-inmate-demo.c
    R configs/arm/emtrion-rzg1m-uart-demo.c
    R configs/arm/jetson-tk1-demo.c
    A configs/arm/jetson-tk1-inmate-demo.c
    R configs/arm/orangepi0-gic-demo.c
    A configs/arm/orangepi0-inmate-demo.c
    R configs/arm64/amd-seattle-gic-demo.c
    A configs/arm64/amd-seattle-inmate-demo.c
    R configs/arm64/espressobin-gic-demo.c
    A configs/arm64/espressobin-inmate-demo.c
    R configs/arm64/foundation-v8-gic-demo.c
    A configs/arm64/foundation-v8-inmate-demo.c
    R configs/arm64/hikey-gic-demo.c
    A configs/arm64/hikey-inmate-demo.c
    R configs/arm64/imx8mq-gic-demo.c
    A configs/arm64/imx8mq-inmate-demo.c
    R configs/arm64/jetson-tx1-demo.c
    A configs/arm64/jetson-tx1-inmate-demo.c
    R configs/arm64/jetson-tx2-demo.c
    A configs/arm64/jetson-tx2-inmate-demo.c
    R configs/arm64/k3-am654-gic-demo.c
    A configs/arm64/k3-am654-inmate-demo.c
    R configs/arm64/k3-j721e-evm-gic-demo.c
    A configs/arm64/k3-j721e-evm-inmate-demo.c
    R configs/arm64/macchiatobin-gic-demo.c
    A configs/arm64/macchiatobin-inmate-demo.c
    R configs/arm64/miriac-sbc-ls1046a-gic-demo.c
    A configs/arm64/miriac-sbc-ls1046a-inmate-demo.c
    R configs/arm64/qemu-arm64-gic-demo.c
    A configs/arm64/qemu-arm64-inmate-demo.c
    R configs/arm64/ultra96-gic-demo.c
    A configs/arm64/ultra96-inmate-demo.c
    R configs/arm64/zynqmp-zcu102-gic-demo.c
    A configs/arm64/zynqmp-zcu102-inmate-demo.c

  Log Message:
  -----------
  configs, Documentation: arm/arm64: Rename gic-demo to inmate-demo

This expresses that the configs can already be used for gic and uart
demos, soon more and more also for ivshmem.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1e213cea8dd881e27addbdafa69080f84415f3d9
      https://github.com/siemens/jailhouse/commit/1e213cea8dd881e27addbdafa69080f84415f3d9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-05 (Sun, 05 Jan 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c

  Log Message:
  -----------
  configs: arm/arm64: Consistently move ivshmem-net devices one PCI slot up

This free 00:00.0 on the virtual PCI controllers for the demo ivshmem
device. It should come before the networking device because it also uses
memory located before it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 59790009132f22d2bce4d72781a81ea0ef895f0a
      https://github.com/siemens/jailhouse/commit/59790009132f22d2bce4d72781a81ea0ef895f0a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-05 (Sun, 05 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64-inmate-demo.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Add ivshmem-demo support for qemu-arm64

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 383f338cb7feb42458f5d8990929f892ffb53159
      https://github.com/siemens/jailhouse/commit/383f338cb7feb42458f5d8990929f892ffb53159
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-05 (Sun, 05 Jan 2020)

  Changed paths:
    M configs/arm/orangepi0-inmate-demo.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c

  Log Message:
  -----------
  configs: arm: Add ivshmem-demo support for orangepi0

Enhance the root cell config as well as gic-demo and linux-demo with a
3-peers ivshmem device so that ivshmem-demo can be used.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/9f696389cbb4...383f338cb7fe

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/9f6963-383f33%40github.com.
