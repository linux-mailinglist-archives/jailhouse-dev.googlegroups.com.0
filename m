Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBLNP7XUQKGQEQWMI2LY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id A889979A02
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 22:31:42 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id t18sf28999598pgu.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 13:31:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564432301; cv=pass;
        d=google.com; s=arc-20160816;
        b=jr6GVxZkoNWOUKvRUpahm2yJD4xvCNyBhBeqQfoCSlCANQx0DLZkxqFJNtDZZmZ7Mn
         WtOoTFGMnmLE6hIe3a2qmBfmMjhW0g/b2gA3dTOSm44S/UpCok9vke3HFE1n1VtPVX8b
         /zrh2u66xHMPt1x0PHwevAl8kDOq+GggSLeG0tiUKeEf2PMlk2lok3wQ7xKq7xH8vIAN
         z9WQ4wL8Der3y7n48xHjmvPdE1HoX/j6W3Z/KXvPTzxggKFtYqqUTZsG2g/b0WbSyKMP
         3Zsk0MVvPz8Rb0FEaXB2MOEM3eWylJP2vaMbRccr4wfSjtq/9j4fIkGAxzel0tpMMjZc
         +N1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=71FFrhGBjo7V4ObovQZbTSw0bpOUYt+34gWAVzjRG5g=;
        b=gT86ZedeBgWRvCRaYawY+0sYiUUuqueiWRxPzBh1wdo9IVDyO8DRA8XIx9fOaeVA5m
         +gTOfgCKlfxGUN9Ep1LxppQwjeHBDpiKGOde46NJYOFKuF7eDLTWdKwyJpU6WhAAFMTy
         y6AclXemEOeGSSxPLR2oxXMIgdTU7/QKGUMsljO0MjCtNMOp/wpFRGb9NdrUs0z04WJf
         SPZY7OiCObDMRFlGyy/K2OK1rTC0B0Kw9sp0ZyOUY3TnAqD5IXumFRdHO309i/PuIYNX
         QdharALnHE5VA8P+XP/LxrcidTPe9b/NSzbtO72JUMvTDdT9ZE6EZ8CJZF72DE9DDiqY
         wSZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=qK8Ievh9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=71FFrhGBjo7V4ObovQZbTSw0bpOUYt+34gWAVzjRG5g=;
        b=GyKZx3LpXfjK8Vv5e7YB7xHCfNWkdTv0GCxcuO7Sw80K42lwl6ymC15jj6Tx+vWhn+
         pyDt2NJg0OZD4B+2/o4X8IFxhnO9xx6k6CaGK70uvYWh6zPW2WDRlYYmwkMk+yKkYcPN
         NXq6wlesiNBblp0hterEm88oC2zjUtJrOXxVTrSzUiHqd5tQzLWCExhTOKJ+UZtBEiPH
         OgYD5zUHh2vKg8mcTtdPi4odr4P9hUHbUhb9B1xlQtrcNInL3Qc8SMJOGFOEe8ImJw30
         lMSNUNLDkQoKIosjF+gYYL/GLdmxrJOuX5xz7C7oKG0j1SRxEWBBwrxnKwNrZs9SHd6x
         dm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=71FFrhGBjo7V4ObovQZbTSw0bpOUYt+34gWAVzjRG5g=;
        b=JFuA845OH7kQ+Kh/ZdZNBkL9su1XINhn2zlSDRw5zM8+qvbucXi0oafB1D5k4rC35I
         ijzVzKOR+mPTLFQC/2CBfmi5OZ8BxhAsdTyv9g5ADEhvcJEiBuGFlRyB1u6FS/C/6C9t
         U6pv/TkruGfonHGdXw6/IJlV6dSoec2cPNDg7REjE4LuhehjXBp+cRmXfZqKTkRAbq0T
         kMvM/3KZYBkBm1Ru8FxqmbA39JEqP4hrQdow3pzQeulQihyEWJxUpxpvi1w4SF0RDUAs
         XKtcBPcBOLY1+05A5Ly3+WwHgyf8fExw7J08BtnH+3jTB7u/lx9K6ijsbvJMvGYyl0v3
         PeTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNuiSkKsHerkkrWMKK07ahcPXLLkExO4Cefo1vQ+LNVYIV6lW/
	T1X2jlwshcUvvxgSivyz75Q=
X-Google-Smtp-Source: APXvYqzKzFMN6tHZ0Edl0QzJ1JqgImU+s/bQH3hC1Z11gzFKJdf3ci8/5WrbGn7UXpHim4XHJAAatg==
X-Received: by 2002:a17:902:54d:: with SMTP id 71mr109235018plf.140.1564432301112;
        Mon, 29 Jul 2019 13:31:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:d705:: with SMTP id w5ls17480662ply.12.gmail; Mon,
 29 Jul 2019 13:31:40 -0700 (PDT)
X-Received: by 2002:a17:902:e6:: with SMTP id a93mr111519160pla.175.1564432300659;
        Mon, 29 Jul 2019 13:31:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564432300; cv=none;
        d=google.com; s=arc-20160816;
        b=VE+M3j/M9Fi9TkOZ75Vnj5tsMBnbcO2RDW18vsTlCxDv0fdIH+co33EtxMl71f/Smc
         L9XPlYCcINrlWWpmZaF+vDRb5euyk8BeO9d581pwe4wx3fgSRSyW+kR4b+9eg2Wdw+QB
         LL7z2ujGV6qSawX6u3pTytRqB521awofBX8bOwIKzFIYwcRtvn5Uil1u6UGvlpxsi7kg
         DYg8IIH9V6WeH9pItQcKXQ4hrl7No0U2+EheYIaz1LzFacja4smeX9VXv2p6Q98nV2n9
         s1tnj+iidA9aMXN62bgAqJ142OBhj7rgFjhQgv/Mj3QMMB31kDOcq46oSbGem5RTWZco
         5peQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=UWH8Uiha3nLudPP6pqojg5kf4iDXxN97CtiC2+CrfPw=;
        b=emZIdy8NxMaU8y1B5ZOPgUZwA7xAJeCu/htnGOGuoi3r4+7DSG1rmj540DLdFW9Gm9
         N1f/ixIQCNYYG4I/WBoH1UzVHRmFvhu0aRtmVM8nQIOjikD2UeBT7TX/tab/c2EGqS/c
         QeKGJ/v4NzcnhI1sVEPZ251dCYlzBVponPb6RaIUrG8A7Hso3SR0yxqVIQgc9KoNv3CT
         vkeUm0vUg1OcI/zJcyKn3qISnjZSjIBwg3oYSZ9DNfhAUWJL6Dq4W7QvabPQRZLfE8ae
         v4sHvI19VWLco6jBxh42GPgvy4EyABVeuK9zx+3bwCNFp0JwKh7mhiBZUbV+dzoT1wq5
         ZOrQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=qK8Ievh9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id m23si2125992pls.5.2019.07.29.13.31.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Date: Mon, 29 Jul 2019 13:31:40 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/dee9b4-253253@github.com>
Subject: [siemens/jailhouse] 253253: tools: gcov: Fix hypervisor image
 signature check
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=qK8Ievh9;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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
  Commit: 2532530358bc4a05be530338756aabd240d2f59a
      https://github.com/siemens/jailhouse/commit/2532530358bc4a05be530338756aabd240d2f59a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-gcov-extract.c

  Log Message:
  -----------
  tools: gcov: Fix hypervisor image signature check

The header signature field is not zero-terminated. Use memcmp, just like
in the driver.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/dee9b4-253253%40github.com.
