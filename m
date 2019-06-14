Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB77XRXUAKGQEWECKRMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB0545AEC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 12:50:41 +0200 (CEST)
Received: by mail-pf1-x43e.google.com with SMTP id c17sf1514099pfb.21
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 03:50:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560509439; cv=pass;
        d=google.com; s=arc-20160816;
        b=iDV5Yq7wc3K8GWVsdlNAgG9+upmsAVoCgb7p8K8i51uFhXnNx+QU0AnF1RCzkxEhrn
         Ph1FpFHGppJ8Y+2myCswj/m4PCUHML41DmBbVnFnRELsvTt7Scat3HpMcTK6Tzh8wl0l
         7MfyoXTfTjmzjwcu15NL+941YYk50s3JSPdLm+8anKO+B+BiEtZyL8reCerpugiYerQm
         mpOJfNetMBt32pkoUuC17snwLxW696mkhPPEPIIAxNQz+9mdSNygJCDw8O7wRSQO/9Aj
         Mr1wXHzNdZ0f/0eK+KmDR8PmaL9A7ci/jP5e1BenNgVTjHgUe2C6ub1FD3Y01Uo6EhyP
         sQtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=krcYyzqm3dY1zS9n/vvziEt93Jr0aP3/5HVFqDEQeVg=;
        b=uTDKHxxQPyp+x+ARJ0XkbcorrwsbqfIxYceGU14iiWXEsKYWYWSwPVbTnMoZv9yEd/
         elWMowFAeeq8EXNlwBOmKiOA8lnQA8mXJUV63O/I4P82jjtjNezDSNUr5OCdMMQzKGNq
         NKrh/j4QMR8+RvVLAHd0W0nrH8CgOSvoFbMDv+QCmSVl92yipL0TeGHDCZoSZuG6ZF+2
         ZUdxvl0cPXBHc9jFQN2uFq+AGJi22hNz86r7he27Wc10R+et9DSBzmPJZKoezPtWZsvp
         1TBgKquzagk4Qjtf5wdtsq5rDl1WRxRnM0OYxA9weX4S6/MNMHPkMCWSls7K2WTggt0J
         ms1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mQGcy+Ft;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=krcYyzqm3dY1zS9n/vvziEt93Jr0aP3/5HVFqDEQeVg=;
        b=lY6LFPqHnJvd92tly5qonL1u0DfqeUCX2/s3dPdBoyzClvqIZZIf2Pwm7y38DPOio+
         gZAOUYrqukwCBbsHOQvNhOvsoelEi3Qz24MlcxUiHxIVYuT5RyWJG3IX5IMMnJe9x7L9
         f5n1EzWXq14cZPoyNRjOtljkXJZEHbU2igG45nvTmFUGv+zpyxkL6xWI8BvWfF6aFhDU
         qP6UMFUkpjxVal5UsW8wFs7bqOQjsvTdar6UMBxSPYaz+zJm3sJtV4LnP8JnJxO3tvif
         EdFIpTsPHGHs6cNXkFHh7PODnDjMHSNtgo8fjhy1NAfdawf4Uh7/S0vmsOOi8Iks9BVv
         dzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=krcYyzqm3dY1zS9n/vvziEt93Jr0aP3/5HVFqDEQeVg=;
        b=ifKO8jAUZ2zA9IN6e0P5bvhDHaxj7fdm9wK0f7E5DVnpv6KBRhZlUSLNyeBSSn2P1I
         rXY0Aa52VPtiBWJvtqU1WcfQoeUXF8LqMVaiq29yJV8a0AjfIjDQ0W1QBSvKvv5OegiR
         hQ4TVIz+Qg0g6S+OCTcNOJvnjQbnyk25ylK9knc3zdyDNZ/JQXRht5oTHfIR+/CzNUVX
         DDUvR8fWsBhREU4doVxUvmbaYIurJiTasxiQPd9RpscVRLtAMNR2VjaV3ivsluVgnhfW
         +SRna3f1QrVVizZGCpVysRWHE8ws3BpE/NWLEJd9k5uB8xnnedtnN4PAxjSSr9hqOH/h
         GPhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXynJYwb1aLYZQKrsL36eI6vZ0ohza5Bt4tN2WNNiOhjhoJEo5e
	2nFpHyhEbFQOUN/Fm7zubk4=
X-Google-Smtp-Source: APXvYqyW75s+SyWglMb12HrWzVPhE3xe1EcVwgiB2+OCgQJeaRlq317jHAN1mcydMLas4rPDKgcdEg==
X-Received: by 2002:a62:ae01:: with SMTP id q1mr42793210pff.219.1560509439541;
        Fri, 14 Jun 2019 03:50:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:6849:: with SMTP id d70ls1959984pgc.7.gmail; Fri, 14 Jun
 2019 03:50:38 -0700 (PDT)
X-Received: by 2002:a63:5d54:: with SMTP id o20mr33574787pgm.97.1560509438906;
        Fri, 14 Jun 2019 03:50:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560509438; cv=none;
        d=google.com; s=arc-20160816;
        b=bxCCLNY09J6r12FIBuG4H0phCQRiWzbwjwNgbDpqb9aMT8HdbWYWtDUQzMBtFKJv9L
         A1h2rVFdPQm1DY7p2MWYtx99RWH67b4fpWt30wthaRNjEg0rWCW/C/SJ6+iIPBWckqdh
         W9pxsI4F8nv7mN5AciuwYFwzMQ2OvUB6sXLD1lGxqLck1Sd0P0Fm3OikQ/7/QKcVmIHP
         6VWKelqwEnQGmlx4HqtThKMMsHdM21Y0WW1M/yMK5JUUXLV5K8gFyAVlSQXyB/cstLh2
         0pd6PqaCnshvpDsx+GHdxc8G0u3klaTGlEbicdme3nz/ZeexVrRuhhIYTlaryWPz9gNI
         XI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ts9pkwwLUQCzedfYtFNOckn/zr0BoBmPHP1Wv/JtJ2Y=;
        b=o6CPQ4sJva/EVfJyy6F4tIL44gMD6pUiKFD0CVOv4h2B5nSzVvZeCvanvlyZ6kYd9V
         zmTUQtHeYgQfZASIUfOPYU+wnhR7A8IevRbXuZZcu6WLrUUnXtiiBPxDOr8GgQxxgRoP
         5/K83jLqgMBLSq4pbqI/30QczLnLFhP4LO4sVIwFuwhkLlcyib5GaSkhFsiAAw25hZJW
         wKxBVl4fXDws3R0DqeJ/ufhWz8U2y1rGR4/jNz76L7PhUiCXyG8Oyd5EaqRs+kMKBmW+
         TQA2ZphDk80/5RX9viSMDKHe4rMJjJQP++nxhG4d8PaMLkfSE2/hXpOg6ruL2XBHIDSS
         Fwng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mQGcy+Ft;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id r1si170481pjb.1.2019.06.14.03.50.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 03:50:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Date: Fri, 14 Jun 2019 03:50:38 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/cache-coloring/ef4ac0-744273@github.com>
Subject: [siemens/jailhouse] 744273: config: Remove duplicate ARRAY_SIZE
 defines
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=mQGcy+Ft;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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

  Branch: refs/heads/wip/cache-coloring
  Home:   https://github.com/siemens/jailhouse
  Commit: 7442735e0862622ac461dee7b6d841c7a5823a43
      https://github.com/siemens/jailhouse/commit/7442735e0862622ac461dee7b6d841c7a5823a43
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M configs/arm64/jetson-tx2-col.c
    M configs/arm64/jetson-tx2-demo-col.c
    M configs/arm64/zynqmp-zcu102-col.c
    M configs/arm64/zynqmp-zcu102-demo-col.c
    M configs/arm64/zynqmp-zcu102-linux-demo-col.c

  Log Message:
  -----------
  config: Remove duplicate ARRAY_SIZE defines

Now centrally defined.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/cache-coloring/ef4ac0-744273%40github.com.
For more options, visit https://groups.google.com/d/optout.
