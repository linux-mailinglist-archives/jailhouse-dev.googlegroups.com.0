Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBXUM7HYAKGQE6UOYF5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 940DE13B584
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 23:53:20 +0100 (CET)
Received: by mail-oi1-x23c.google.com with SMTP id o124sf5456744oig.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Jan 2020 14:53:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579042399; cv=pass;
        d=google.com; s=arc-20160816;
        b=uMFtHgHa5H9Pnp6Iv9fPzEJODGyATylVrIu2r7ueoVZwJeGMtclzZDFK/KKIKk79UZ
         2CzSJSSus9s2idQiM4i6xIGfYQkJuPoG2qz0oGD7BobW4USHsgdEpqhArcvTy46midAm
         1+mAAe1JV2UzWJfUqixPiGaXNga/3WU76Ng9FZk73qL7HuF8Wbn2zXpl3fyc7Xj+oI6O
         se6WstFL53McmG9mAqH6bqiByuLiA2SjT+TE4KkaWo+CnOmWOow6INFX6lKHDtSaVqA9
         HjeL2Yf0Di6RcInE3X3DqIgvEOZ2OLPLsDUYfRmw7Of+7pIFChJGHwVPQlj11C8iiZXq
         Lt7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=e8LF7s7qK7w4HVjQ8M+F8Fnct6rXvIwfplZD2+VUjTs=;
        b=tlz96XgCQ9bJwfb0X/5km9XUm2pHM/cLxFEtbQaxcJuXoZxqfue8td6mGqOb0uwmXq
         cxxukgYiYpp18qX6BGequ3MOUjEPPAQAZFVEK5HVnfuz2NxP+mMFTGJ/5hhnCv8HS7+1
         FwAHkuqcdwNVAuwAMxDn+Ao/8THW6VL4gxkYLB33+EcPRFdyNjGY8gjxuLOZyydaHNVg
         9OCo5Bzj3GgxIUzTWqKu2jl0SsznacgdEySIY3mfBay+Ev78rZ9dUaNpa5EuxG61pXOD
         Ur4HTFhP7rVmU+/zzmRXlHIm5gmLYCDrIBugOqHwACHGvPfSAlSoNiBOdDMPDOyyatR8
         tIHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Rmt7SHRZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e8LF7s7qK7w4HVjQ8M+F8Fnct6rXvIwfplZD2+VUjTs=;
        b=GbHse3URXgwxgurIlHy4av0REe5nayzRSv89gQSYp2eOKy7e29dDZp8r9n6EeArr7V
         Oj54wodN5VhEtL8TrBWhjsbr36of809cKMHX+n5WY4SbvPD7tHSahS1dNRQy7YJkO93N
         oeRSRdvBjmCYT4oXU2YRoTo7MdqCSeRwtdQ6dUWIsTFRsiEYDo4Mw5jogqHiPsXzvP3d
         PA7zPT4+hhr9ZDv2ARRxttCkoso5r1MchdJrK3jBItDeAE47oceUdYKPE/xxBKeLVoZK
         Bzx1X1OpQTctYQLPzvqwLuQPDA+jgx+Br7UlytsY9ub2h2jJVMUiJn4CZlPghyD7c1cd
         92uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=e8LF7s7qK7w4HVjQ8M+F8Fnct6rXvIwfplZD2+VUjTs=;
        b=re63vKGFA9zK/vzSJbSMQTUtgL5BQknGC3M6f7Fc8wBw87IANR2QlHRuTONGGqXoqi
         gadKnQrZRiMCfUv0g663pg4agG3X0p01BK3ahN4XUs9ggkHoTATtWbrGDiGs9w5YDyLg
         p3tERiSYdUbjaMIYCc/mPZ/Awpai2MdkyQZ9mB6/Tqh3Cww4lKnfuxQIDpI2Ef/HxQzX
         uHwPEoQadoNMYYnDYuLCUyQg93gLNJvGig5Fcnr6FfFVSswkJp79YlE8ZtVPZtxURj1n
         wvodrMeCxNLpGX2p2lvropkYFslHNRrvxn2FiqrReqbdWDCZ/XougQa7Eh9gdCREL1lW
         +DCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWVn6xK1ql8K5+G2FLNba+hifQUjqGgiZGLNJ39k8Jv7I/qwHZe
	In3ahVeitbRzFF31bfOb1gg=
X-Google-Smtp-Source: APXvYqwRViOQA4VNjV5g0ypTzOlTx4u2Ix9zaffA5JMQXT8PIT2wXdWgbesuZXLMTDsdcr+PiVMvQQ==
X-Received: by 2002:a05:6830:1d5b:: with SMTP id p27mr522023oth.263.1579042399030;
        Tue, 14 Jan 2020 14:53:19 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:534e:: with SMTP id h75ls3022170oib.9.gmail; Tue, 14 Jan
 2020 14:53:18 -0800 (PST)
X-Received: by 2002:aca:48cf:: with SMTP id v198mr19048114oia.35.1579042398510;
        Tue, 14 Jan 2020 14:53:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579042398; cv=none;
        d=google.com; s=arc-20160816;
        b=mtpVOgSGWXMjPX6XzdlqAyb8GKWQfTkveNiZK8yLU6gmO9KLSKr0AW3UrTpy7O1BLo
         zbgT6xdvjIS+v1kr1Cvmp1anGJDqBLw/Q+TXKMjP0Hj08awQI1sFW0cY+GvJijuanDzp
         TmSnFh5JC5TNACUpP2ixJSyps6rTfgNZdJ092u3955ycLIoJjdKiqLRvN4VIRJTx933M
         MgL7f46CXyZx9HVGRXu+MsIr7WQohAaRDD/TYG68SWzJLGlE5ZnCidOgf1pG7uPk2w82
         I+hbhsnNe38Azka224vxio4wSX+d8TR0z5hPwnwle41/Qeo2lZR78vd68TsyKpmfhbq9
         4m6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=A5eXtSzw2RXDJ4AICbL1Yr4bPvSDmHuI+ioucoS86W8=;
        b=IQYmFbqt1cWcXXNttRNKsqShWwt0Pt+Ir6rvrug25dpw05GgLPpEiP2hoCzYnNUvuJ
         eXfRLMoGjUImCiFPADvO/zpOZAVdl7Bg5KV3dtXefdZNtUctjm3yH9hhIyjdOjPwnFvr
         zLLt+rsbJTdbDRaw627UZYet536h6aGmKdC1Lt625jc6nIap9Vy6dVBPRxJpwF9bJ5YG
         rTl8dcCtSFUaTdHTkUMfO2M2R09/GMObpxIyhUieYdIEsE7kmfT6CqMCMhhxaxI1gVBu
         nA038Aa07OCOaRhkNCptwyerHVgXAimLfxIm+Wxk/VBaBKkrDhhgGggmNzIhNpQ68XAn
         h9KQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Rmt7SHRZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id a12si797066otq.5.2020.01.14.14.53.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jan 2020 14:53:18 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Date: Tue, 14 Jan 2020 14:53:18 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/8b5172-9eb860@github.com>
Subject: [siemens/jailhouse] 9eb860: core: ivshmem: Unconditionally check ID
 range
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Rmt7SHRZ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
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
  Commit: 9eb8608a209b0ab7aa6032fe8dfb38d043d4c1e2
      https://github.com/siemens/jailhouse/commit/9eb8608a209b0ab7aa6032fe8dfb38d043d4c1e2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-14 (Tue, 14 Jan 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Unconditionally check ID range

This check should not depend on whether we are adding a peer to link or
starting a new one.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/8b5172-9eb860%40github.com.
