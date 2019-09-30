Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB55VY7WAKGQEG4W6KQI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id E60ACC1F27
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:37:45 +0200 (CEST)
Received: by mail-pf1-x43a.google.com with SMTP id s137sf7539780pfs.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 03:37:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569839864; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fxi5N3LWyvPAoz0bcNXrsi+3kBxAFu8tdD+Buf4Da90U8sNdo2lzrOLzXGtRtainXD
         NMtrVWZjrPDydrwmO3p3SVoLyojLWHfjfFp/VdUvWjd2TLaKiasby2lvoqzwU8aDzoVf
         qsoMPtSZo862oBuELkuqKxuN2dSHxb+SFydFhymsALfXmoOyftA36m76HQ9Z5n7sKOs7
         RYpCXM8gxOI7jzWuB2kl0OXE5xT+OQIipoKXKxQm1V6wRq1u3cNbh/TA1QMnf8XKH6+/
         bg/S014+Ops3Nwg66VyQ6zSba3ldSTZwwQzRdKoZgZWZ9hiQdblxAnZOYZA7bOqzXUE2
         mcLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=YkgIrq7U5Rn9iBqTaVW36hOGkn0rdjk1egu7O8DkmIw=;
        b=EDRkHMP0gqYH/3VzRWJySQ40uRlJkc1SdAuPmFIFfHf08IH6AkLyBpDMsiuHmuKWfR
         /PHvrKJbGjGr89SvrmRJAIjFPsAzdJqa0cTE09qVZDnFOj2VCCf5a4PDixOFkucmCEPB
         FxRkNkqCC89+PnAV7mk5FUsVqi55tsrKWSIjuVs8x+Wy6yziKdYH18Dt1a+YLTJaRwl4
         zfxXqMxFAXMggKc0j5ZKWL069SGB7dh32A5PoaKHVdHmOFiAZJAnV0ukfFi6juGGdSu9
         Ng2LPEBU8oOqWymntL2KTzqkGou5tg4NM3CJVKPm1t6M/nCTJBC0I/cieDquOzz19dox
         DCLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YkgIrq7U5Rn9iBqTaVW36hOGkn0rdjk1egu7O8DkmIw=;
        b=juYHJEL5H7oQex3L2o2B8DHotF8vj87Ahgx68Q5DoK5bjMUNd9oGJDfxwuiyQZeHBK
         n76e27gXO5QOXOaZlFDZvPvbeY1MbXtl3XYxiOtAFjsqX/5uDkbGTxP5Eo6gdEXic1m2
         ymbI9T4kkXwkwogyTxjT2NwbuqyStsVt03fBZ1/PveAtWhk07MaV6zM31PyNce6VL3zA
         a9usRgpJVTbGj1K5GtSRTKokkwWoVF60U7/+Xi5EXjcW9yQ8D8qd3sNRxqeBD7XPu/b2
         eMFaKvAHpCFPffSGhWl3TDuF9NTdv76stqAKlbzBGqOLa9qIrBc8MkQ+SozfBEmGhBwt
         4yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YkgIrq7U5Rn9iBqTaVW36hOGkn0rdjk1egu7O8DkmIw=;
        b=X7Qu/+yp2TBKZIgZxm7U9RhbIHXr/gvms9pO3GZ6QiJWVs+t5K4gQ0HXAb7SRxq1w0
         nSCeP35sp1BGxDNRS52DermCgagWOPllI64HWQNPV5uMDYT7aqkWzMHw9seukK/ROb8U
         EwrMl4y58P+oInIRCmRFyAAWExtopkZmBc6mnZSNgcAz5Vp8ZBu8nI+sJNMwwZ6xbOvN
         2/iLh8CS93riOX0ABTGtkf6Ok2c78JCCsMmEuH4n/8sfkC0zuRSvZu7kT4Zd5UQaz8JF
         SLqjZ35jRxpCSyCSVY2kXQ6aUr92u1uD1U9f03P2ucAkRKWXfj22DuTNvhatO5H4duVp
         o3Eg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUbpePVp6aMuDH8jTSE7qZuOI1GE0PZE5mHKo/pwS7nNUAL5Jm4
	EZKnfsfCANG+Mr4WL0glM9Y=
X-Google-Smtp-Source: APXvYqw5zNxa9Ct0Y1DSyT/n5EW7D7JSLrc1j6pqXwFCsh82JcgDz+BXZfCXB7nYQB+apLyPkEiUtg==
X-Received: by 2002:a17:902:d88f:: with SMTP id b15mr18601990plz.251.1569839863755;
        Mon, 30 Sep 2019 03:37:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:1359:: with SMTP id 25ls2939647pgt.7.gmail; Mon, 30 Sep
 2019 03:37:43 -0700 (PDT)
X-Received: by 2002:a63:465c:: with SMTP id v28mr24003492pgk.310.1569839862984;
        Mon, 30 Sep 2019 03:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569839862; cv=none;
        d=google.com; s=arc-20160816;
        b=EL3jjPy4GwlbmQiYGGjXKJHeG10usljbF6oaRbdgdJd4i+P27Q2O4Q4/DE2ibZvLxR
         RwArCz43/GXA/EGwOo9pAIs25sixT0CgF9XJpPMPjcOGDFCKVtQStUhLi0q4B+EEwiRJ
         fq55wR3o6QwDqEmfzF29IBkB3E6akDSSROlPDNl+usOZ1dHcfeVK90Ntvq70rmKFR7EC
         UqWBY/Dww0UxzqGCFu3H18THpeR2a2jTaU6hhkKtZyVP9uwW121XXev6goC7BIjHWL7z
         xXY1TvhkIe1SGRlpWI2d7IMVyKCdiI6XAoNbaCYoYj7zzcH4dHOn+4uKunAlUQd7cyyS
         eZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date;
        bh=IIiZGVELF79TUgSb3UDoYtNef5Kav5rqxa3yOQ89xR8=;
        b=QQaUsGYldOpjaVitorO9CvULPU5LDWra2IQ2L4Sju4Xc9/qr7HDPwmXlRDPIeKQk5v
         armQwWzn6kABEZeJWvQzp/8WNWz+9y5X/zwucSE6Ma0xbJptb406ahHsqNzy8uoS1zYe
         afMbyF0JAHXjU7Is8O/g5YlHC/cyEhjAratA3AA58ciftWs4XhcxAUXRxblJZz56Ov6h
         yubk7CPoV4TdlnwK1EVd6NXQtLJMIzK6II6iShy0+f83P5b99GJpdPrkmkc+5OngXYQV
         UpR5weDgLvAqTs7QSh3ULzWv3PP3PvIZBKVL/st6SfYt+ykERrqCrm9VTwME/7tWtRtX
         qfzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id y8si376418pfg.2.2019.09.30.03.37.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 03:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Received: from github-lowworker-2ef7ba1.ac4-iad.github.net (github-lowworker-2ef7ba1.ac4-iad.github.net [10.52.16.66])
	by smtp.github.com (Postfix) with ESMTP id 38E9CA039C
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 03:37:42 -0700 (PDT)
Date: Mon, 30 Sep 2019 03:37:42 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/597461-421840@github.com>
Subject: [siemens/jailhouse] 421840: Documentation: Add specification of
 IVSHMEM v2 device
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
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

  Branch: refs/heads/wip/ivshmem2
  Home:   https://github.com/siemens/jailhouse
  Commit: 421840a5eb169c1f6a65ab2c75c6bb3012253086
      https://github.com/siemens/jailhouse/commit/421840a5eb169c1f6a65ab2c75c6bb3012253086
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-30 (Mon, 30 Sep 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/597461-421840%40github.com.
