Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTMWT3UAKGQEFKWPHBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3e.google.com (mail-yw1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE7482D5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 14:45:02 +0200 (CEST)
Received: by mail-yw1-xc3e.google.com with SMTP id t203sf12061407ywe.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 05:45:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560775501; cv=pass;
        d=google.com; s=arc-20160816;
        b=qcPUe484Fl51ghHGgdFnc0wwJMabeIbmQVrzKInPEGD7n56VdK2u1DRM/DG0CjwuLB
         ZlIfnElaIYzEGf9xPXVRDHx+r4F3WARgZCMEV0jR3NyYdvzTRUWvpSLfkh+7+aWuW8cF
         /LFVP3Wj3AU1kMLJXK0mcfgZC9vFlVI6yq2Fwq3gn8V5AQPp76gkqA5ufcQth7xa8NKe
         YHCuwrHkLRS6wYtk5S30o/sYO/X/SC9IbysFbobi4JkmSYD0E9Az0D+T6mHCFtDoAytW
         BSyz7ueRB6qixaZ1z9+9UqhMHKsuS7e6/VSHLtnh+fM0XK0R2kGu10RgDtUZbWVZ313W
         dlcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=rwVNZYrNX/swjvcJu8dcqWhcRWZ5tIFOPbVS0SA3I34=;
        b=azG4lMp2NZ6tao8QiwwvrFE2ibE763cl9JIApTVuxWmNpFLnJ7KfSxPo/TJDkTObln
         7OXsrpjp2sJ2hH1KPH1K2OI0hfjI/D1DSqH8uzEthxZx18WSQr8EBxqpQqX5ndgfEog5
         EqYGQhIFvaanO6z9q3CmhNMUV8oFy/pRJAMXUfi2pY9OFKUIJAP+FksUuGxpGXHhggxS
         Hijkm0vXIgwd7N/QSvVX/rbtDSJGE8RSykoZFMrg01zbxvUvd25Mq44bQFCTAJmCytXe
         D2RLgHSBPqbFzMPkQ4Pi6x1qwXYLXt5eulojrIv1p7y6gqx7xPHe8v/Rcrm1NfDJooOk
         +w2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=QH0cvTDS;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rwVNZYrNX/swjvcJu8dcqWhcRWZ5tIFOPbVS0SA3I34=;
        b=pT/Z0k5jNZqOSXb4ayteiX4LKEfBiSQisHNX2h8a9eEyizOffW2CZOK4EYR8IIIvie
         /cKDfzZVyPwdmadEIX4qv8ygg/Y6XguFlhme1aj3xtf6rmpvTOureJpCq5XZTIJqltUr
         zF7BMazGfpN4DR1qaNegHNjpw1KnLR+O+fWclSLW/sDfZdMQu0cYd2OvFiC04UeeJXX3
         SkEqXex5l3uwmtlCYkL7rxLq3zyrgZJY3PD7YucKpZsrTdr9gpIeetkfkMcNxPrLWZO4
         o2CXTtxVLYGC8EkIdni0aUGyxeVo8tIh5iPgqbc6vz6w6GXW0e5kBObkTYEPLeten2NE
         7p5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rwVNZYrNX/swjvcJu8dcqWhcRWZ5tIFOPbVS0SA3I34=;
        b=T3ZjF17+CVVrS9SuHPjnimkTZWrSybiO+mJzgbgnLbOP2Uo4a4KcbMI4VZWCOEH9bs
         q0b9Hl/U1DcCrIe5C4a3w7sgU1DTOKL2P4pm2sHy5qDH+pjytDewpzb6g9PS75xzcN8S
         JxtSMiXJRmsfGraEDss4PVlFPA0H0grX5sKrnppgjOypcKwhB8bvs9JmqqVNjGLhuSke
         KN6Yxgwh2bzsubN8tDL8GwyFLgLfjx4qu8RI6BCmQmwBbzZ17rBDi86KlFCRt08hVBdZ
         OtMyoVvjao5oXRGIwdM16+ohVjriOJXksMIR71NGJrX/NVc46uv7/gi66biMAB3jAZyM
         dHHw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX/+Oe9Ftagf8QUaGoBErEq/SU8KfM0yTf4KUUgc7PuKaGQCCyR
	vBJQVR+keNHDqH4tZFcta2Y=
X-Google-Smtp-Source: APXvYqyoLh9jpixqP6gY0LCJTlppvt3rjPhi7uE6jJl9rQrYVTE8ixA/JI/A54ITcifWfQ7klMT89w==
X-Received: by 2002:a5b:412:: with SMTP id m18mr56765562ybp.497.1560775501744;
        Mon, 17 Jun 2019 05:45:01 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:e301:: with SMTP id m1ls2305364ywe.3.gmail; Mon, 17 Jun
 2019 05:45:01 -0700 (PDT)
X-Received: by 2002:a81:1bcb:: with SMTP id b194mr45451882ywb.321.1560775501353;
        Mon, 17 Jun 2019 05:45:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560775501; cv=none;
        d=google.com; s=arc-20160816;
        b=0Pca2bUQiH68SO5+GZaAerVcc/Tc0W7ULT5EOUAzTfrJZX/vTuV7OY0IaS5tisDMGg
         FzZ2lXtHUMogfnPrKXpNT0yPX+3jX+dRAgUo36fAuP1igD+EB+n2Hh/p0ILJH7ofoAuN
         AgJ/XnCVKOrlPxL5iizK/wqSMYCcvf009qKgp/i+65Am2nJN/wYpvElH+5Lp1JS3+BEt
         NuDbFQc1VKS5ZQoNFzRsQ9iPLlH/CZC669ykbpTNPafBSEzXoryAPE3AqGXEmNha5uo9
         DejwcIlRAOXhwG7T9kxxOVkgxCjloikcrsmbDQ4wg/vzY7iXc/mFgqJ4ktrBU0rikws1
         NlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=xHEWhpPrmW34hZLiHur1IQWh70E0qXn5oVZY+KeWyWU=;
        b=mIzaX5DHpraHjTHMk7n9ASLQ4ZEzbuGrO9EyZBpZvve55/m7K0aQSVjlo+dhIfFuHo
         qBtih3Y+OE6VLHCWZ060kziwxFKEQIYL02UxcAqT5P/6RzvKFAAnO+9QDBv070UVCF3A
         uyNICakQsJO0ebOBksj2BbpofV9JudLdv851a2UCvMyKJfiG6v2BaoMNZ0n5eyIx1N2Y
         IT5ERWj5IcUYGD8KWUMY1flmwD+Up2eAO5XZOmbr6wXeKPbu34yW1vyvM8rp3dcBJwZX
         wsbLR0zkj1zSc+u9YizHtVcyEwBCwxYoqj+P0S6ZZ+cb7d1PWnxk0bh8mMNa2PYknEGG
         rfAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=QH0cvTDS;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-22.smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id 189si759998ybc.1.2019.06.17.05.45.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:45:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Date: Mon, 17 Jun 2019 05:45:01 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/4abf1c-0238bf@github.com>
Subject: [siemens/jailhouse] 0238bf: x86: amd: fix comment in MSR bitmap
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=QH0cvTDS;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 0238bf8e9751a36ba66ea6c1f8968fae21a6c6e4
      https://github.com/siemens/jailhouse/commit/0238bf8e9751a36ba66ea6c1f8968fae21a6c6e4
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-06-17 (Mon, 17 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/svm.c

  Log Message:
  -----------
  x86: amd: fix comment in MSR bitmap

So far, the MSR bitmap intercepted writes to 0x803 (APIC_REG_LVR). But
we need to intercept reads. We don't have a real x2apic, so we need to
forward reads to the apic.

Interestingly, APIC_REG_LVR reads via MSR never happened so far:
Root-Cell Linux won't use x2apic's MSR-based access, as, of course, it
doesn't see a x2apic in case of an AMD.

On the other hand, we emulate and use x2apic for non-root inmates. But
our inmate library won't issue REG_LVR.

The correctness of the comments of rest of the list was checked with a
short helper tool.

There's also a read-intercepted area that can be zipped.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/4abf1c-0238bf%40github.com.
For more options, visit https://groups.google.com/d/optout.
