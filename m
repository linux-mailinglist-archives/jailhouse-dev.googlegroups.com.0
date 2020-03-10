Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBV6ST7ZQKGQENOBU7EY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6911807E8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 20:24:08 +0100 (CET)
Received: by mail-il1-x138.google.com with SMTP id c12sf1199359ilo.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 12:24:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583868248; cv=pass;
        d=google.com; s=arc-20160816;
        b=gKEa0CgsDuvI7wt/YoXqF08eIjK/xB7oyDuZERrgg4OnOz9LEx6PBxkugZ5Q7mXRSt
         QmWIObP00iLFSNRvFjICG6W7q7L/WruOfarSLJf2e5F0ffcydoN+vc1CcGONPBZPA8V6
         lvNXM5tgbPAuqkOMa7nJ9Hm2h/tDLKn2Xrw4GZiKGMZ4C0BrwR2fJl8Ql3VkQe8Bhowu
         CaE/bNH6PnjZxIoket6rpE3FETngbv8vN4SEYstMebt2x9V5AfUk+FIv+ynr26z7uhra
         1iLSOc6/1khssWq8P10AaeyswkWKNxFat6xSuc30vbWrZdr/Le0ikJ7xOCYPQWJpYhHq
         +LGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=fM5xTju5vnvWOuc5uNqGAuZvK4jyjiznmQlW92rpnP8=;
        b=Y+XxsurgQrEZP0BnsC9rq+zBpY3Pwb3X3RFcmQkUxa7xNP3V0gY3bEho38OGc2jvGZ
         /GTFrl2vfNT7pvf56KxQ6v4j6XYO/1hs+/51tSVdgUtlOcnhZCr4JNpYjx/JGZggIli6
         0N1+f3pUsmM6BS/tEHMo3WvrXw6XV2mTVbRC5gs8AR+pmLZmKfY4CNtJxBgv0l3GiKc8
         qpbJ9Ax/DBOuq/ScjUN/7v/wFyW8yqMgRB+6/XlSft+na/uNfVQZWyo3+kh6mK4GXbLt
         fm4ZfSd5dVlUKhqmGYHOT8/a4TG66Si500SldXnjV0yPUy5X7gEQQo2liSu/tSnk003a
         oeJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=FjZ8YWKp;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fM5xTju5vnvWOuc5uNqGAuZvK4jyjiznmQlW92rpnP8=;
        b=kYLQ1Fa2Ykrci1ejsafXeOQzx8vkx1x2yi7sobM6K7shUJg1RKhSV8bbGSHNHJimGH
         79rUgIOq1sFPfhRGw/Ak/L2T8dJ1UqL50NNFRdsDIKCGIFo6XQ1OFkwn/Jnv3ITFzr+1
         LsezyftY6MxbOvMYHiM6HYxoWhHwlmonHuOeIMdf0Rmt0wQ8Tjbdj8HZzyEV2bDOTBK5
         f7GmMXV85kp3JV72oStQCv8kyTiQ518PxsMj8muajF/Dk2Eozqvkk9VP9Q7FPweMt0oR
         YvElW4ut8BGBAMl0dJIW6cn0LY0xgewNjLly3laMK3a9G4B2xKqbif5KSvC4bm9aHYXu
         ayaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fM5xTju5vnvWOuc5uNqGAuZvK4jyjiznmQlW92rpnP8=;
        b=r9c2kJtRPSrc3AAY5+jMCb+5bT83Gopxv2MGtBWZC0fsQxr81kle/XYTbIAxf2vb49
         0hKPru6y4DWwt8c5q0dD73qxPStPvYW/eORWZgPqLuv3V+aHgbHnfUlndrvrCiy1OlbB
         J5ndTB5Gyo0d5K+FCyLTmFWemhHU/v6wzocjisQWAAsKF+MMe1lSeIVCrDH0fGCo1jHw
         3icLbqOqmaDXQnHl94kQifWEKA/8Z08AstBrgrhuvcD+JJn44vIif6+yZfxNv1iUK0Dy
         T9K/Jz8mQdH6Ne2mGperuUFHUhkoc7GuemvkSNtPVcmeGA+DSNV/M+merH2ZW7//DL0R
         s4Pg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ0OVrbcPOJnU2UJGw0xfhynJoK/hE8hbGvuuyRKYFmy5UAW2dml
	63iWMouMrMRI2ojaHf6EtDU=
X-Google-Smtp-Source: ADFU+vshnL+8olbOZ5t5iketwRinjtXI8cICsMEy9DwQhW+4ZjhFhaGf8lrCS0W3e6ZapT6nIv/MxA==
X-Received: by 2002:a92:8901:: with SMTP id n1mr23403695ild.176.1583868247820;
        Tue, 10 Mar 2020 12:24:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:9cc6:: with SMTP id x67ls830973ill.1.gmail; Tue, 10 Mar
 2020 12:24:07 -0700 (PDT)
X-Received: by 2002:a92:8fcd:: with SMTP id r74mr13069888ilk.39.1583868247272;
        Tue, 10 Mar 2020 12:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583868247; cv=none;
        d=google.com; s=arc-20160816;
        b=x1CbvmjviPlMQ6iVhFpYVjJyVhVCCJ0l48ZzwaDPeI2GejT6HaN5ClbVQAGTksFl3R
         zNdkqY3bWNkCbK1qjqedpQnjWFULFft9lc7ICGOuF0UJzrou4J/pSWwNO26bNJEZE8FH
         4VQspPk6HU3wZKZ6vKeuRx9aBJt/m/Oiwi4vjwhB6sahXNo0bSMzr0d0blzlHHdDbPug
         ycq+OhQwhn/vW7XJlX5XJMJhMxNUae2s1seadmboSF3ErqS4ZLr6DT5bYwUiG7c3oC5b
         iQ/ZRbYm3ZT6DrAT9XogjxxnXvmLG6iwupI9dHUWtxPYZAxJYQq8JTnvGi8ASQnXd9Jr
         lSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=SIkFp9cWIv9AJFTLF3TSkG4Zd6qx2YBD9tpW5zMuGUA=;
        b=OtKTP8KkCmREdm5hQ1CXxoF3ZBi8vq5vwl1MCqwXHJ3CBQ+BLemNDlr168rSUBVWFJ
         wklywcY+Aw2ur1BINxwTtwHua8c58vBnlqfLvXx+nW34OEdcJvGifOspH7aaOLbhbfHu
         YimW4fHoG5Uo7vOlr+CMKxvu23YU3ut2dPryX/oafPVgp6svgCEk7vt2iFyVZFYmuccf
         vXdL5hWolDNt15qVIOx1KD1QPWsaNIukC6NPPvHj5F+KO4KcRjpsiNDbC9pedUGe8Ert
         qfDQKkS+h2G2WrmRBF9mUQFrUhpNdP929ISZIMDNuO+rsnoVF6usrdXM/xwUrGR/miy2
         YLbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=FjZ8YWKp;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id b16si783953ion.0.2020.03.10.12.24.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 12:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-1ac52d7.ash1-iad.github.net (github-lowworker-1ac52d7.ash1-iad.github.net [10.56.25.52])
	by smtp.github.com (Postfix) with ESMTP id C21B26A1D46
	for <jailhouse-dev@googlegroups.com>; Tue, 10 Mar 2020 12:24:06 -0700 (PDT)
Date: Tue, 10 Mar 2020 12:24:06 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/f76b0e-2e4d71@github.com>
Subject: [siemens/jailhouse] 1f16ea: Documentation: use virtio-ivshmem-block
 for block ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=FjZ8YWKp;       spf=pass
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
  Commit: 1f16ea47d9d99f7f6fde1aad65c8ab7ed77d54ca
      https://github.com/siemens/jailhouse/commit/1f16ea47d9d99f7f6fde1aad65c8ab7ed77d54ca
  Author: Philipp Rosenberger <p.rosenberger@linutronix.de>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M Documentation/inter-cell-communication.md

  Log Message:
  -----------
  Documentation: use virtio-ivshmem-block for block backend

The example for the virtio-ivshmem-block shows virtio-ivshmem-console
not virtio-ivshmem-block as backend.

Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2e4d71f66439f8f6223b129b1b8f19062a851342
      https://github.com/siemens/jailhouse/commit/2e4d71f66439f8f6223b129b1b8f19062a851342
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Fix programming of to-be-masked pin

The unconditional writing of both redirection table words created an
invalid intermediate state when masking a previously unmasked pin: As
the entry was to be masked, the index in result was set to 0xffff. This
value was then programmed into the upper word while the pin was still
unmasked.

QEMU detected this invalid redirection table entry but only a message
was logged on the host terminal because QEMU does not emulate error
reporting for VT-d. If an interrupt had come in on real hardware right
at this point, we would have seen a VT-d fault. Still, no kitten would
have been harmed.

Fix this by only writing the upper half when we are unmasking the pin
(or keeping it unmasked). And the goal of bac03e4d5f54 is still achieved
this way.

Fixes: bac03e4d5f54 ("x86: ioapic: Rework and fix redir entry programming")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/f76b0e89ed89...2e4d71f66439

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/f76b0e-2e4d71%40github.com.
