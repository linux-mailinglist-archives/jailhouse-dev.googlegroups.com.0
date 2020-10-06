Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTHP575QKGQENTZ3VPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x237.google.com (mail-oi1-x237.google.com [IPv6:2607:f8b0:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBB7284519
	for <lists+jailhouse-dev@lfdr.de>; Tue,  6 Oct 2020 06:51:25 +0200 (CEST)
Received: by mail-oi1-x237.google.com with SMTP id n9sf2740567oib.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 21:51:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601959884; cv=pass;
        d=google.com; s=arc-20160816;
        b=S6zovrIFjgDWWQLJOZuntOpobvFjyx7+lNyYB/7Hx4a7hRT9waGiCKurf4+DQF9xi7
         rZouszgHaqoUqA5hlyClcvfJvkVonZiYdbvp1/sDC82T+Jvr4/ShM37MAoq99p2uWhhZ
         o+6hXca4MrDfUThtxXacd2l722B8fCk/P19JieCvkVznaLfRmKbTvHP+h9ZSXcXG7XfG
         O+K4G42Y+WlOvZvkyJFksKUD70b9/KdlTAbT3xNFna3aErX9MI1ul/sK1jd+Gk8mz9WL
         W7FwfBVha1LTMDypW4aXU/71jJoPVR4IfCWH780FlcCJI9wrbNrDSxa9iYekOqaPcH07
         QPiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=D4yw0PhajkSU0Sum+numtEjx5v4wShOooU7wYofRDg0=;
        b=SPmHOznlZ82VnX7RWj+E5q8eTRSYOGoWAdJPTI0P4iqv43JsKaewf1hzlQarAdcqOx
         Hs2minQ8evcqVfnSfBb6/071cwLiF4TCijalxTxLpwgfXXl/ch2cF1iMbfNjUeKFuTdW
         GOwFl3dWXPVDgjXAxPlKjDUyxbeveVjZm/hQFcVtQjEG9R/l5xE0O5zJfEEFW8dhHwj1
         h3Xgk2IpoXSDhXPCG7jVjIZUn0kwrlBqV5lPcIIlp6kQyR1sVNSU1cDzt4A7llX+4+gn
         mNEAD0VtQvKzf8+x1h//QXffmGRBO1PMdHT7UgAoBdxCcqXf6FZ8r5n3JQEbBBo/6GA2
         vgXA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Eq85PIdy;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=D4yw0PhajkSU0Sum+numtEjx5v4wShOooU7wYofRDg0=;
        b=L6M26oU0sIwj2fXsYes8f4je8CsMTzrfTNRHF0Xc1z9rFCx6ZqfnMQLMxWnxw1f+mI
         GG00Ue/kTbHHg0BgQpuINdyTi0DF7PLSJiDYOxHDtJFL9EvQRTRZ8l/m4VSSul0kV1k2
         zSaV3KpaQRu0H7CaKbVHdXUzbW1Wc9SdTjP0DTsBh6B+3+iWuLtk13qQZ1hpx5wV21Tt
         fA3gIMzZwMFCW4BOaDE3tlkx0Gh1WpCPwZSz8lhFR/IKODFvG+YGQUo5Iq+8XUydxYtg
         jw/5rk+OeEbmr6PtmoCZqGCrqn+Qk4jzGOwGguaaWmHRh5bYW898BtpUbXIe4VurddOM
         T6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D4yw0PhajkSU0Sum+numtEjx5v4wShOooU7wYofRDg0=;
        b=oqImAeps2w5ydYkfyenHF6Qn4L1KbPIIGwrjpzFz2Lk0zI57uK0UZQZS2wiDWM8dUO
         MKJPle79L9TmKFtuge5N/Dg7xOPqo4LCOoYumLUZXykTKJ406RIWp8CPK9UMHNYbegAQ
         0bfWPS6JyenXCshtzVxQI7RxwaL3w7+XNnahQh016Kg9bjCWpnbW6YxYsC6vSE9sTAjk
         smCpYGv+eY8Rk92B4jdx6s9cr79AaFRNTLfEAdmKuSeaX8CJ4oU0aU8KmmkF4Pq32Iun
         9zoNxonFbc6uCxx6/LlN4B54ayl9antrjUk7ZinxlJFF6hBpxDreXs9q+On0Jf5nfHpa
         22Zg==
X-Gm-Message-State: AOAM532znnB4OsTrpuklLD0hfbDzM/2nNQJUoZtUrnC9YQTThhE9K8Ii
	fEnR3S7n+vuU4Z9iEC0HWlA=
X-Google-Smtp-Source: ABdhPJxl68NaNunbrFik5zCDhNN4p4ADRU03M/p2wMgT/PXPExh1ukyps4ONarxVlxllh5B79qQ9SA==
X-Received: by 2002:aca:db0a:: with SMTP id s10mr810859oig.126.1601959884686;
        Mon, 05 Oct 2020 21:51:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:a84:: with SMTP id q4ls2646392oij.8.gmail; Mon, 05
 Oct 2020 21:51:24 -0700 (PDT)
X-Received: by 2002:a05:6808:254:: with SMTP id m20mr1726474oie.139.1601959884243;
        Mon, 05 Oct 2020 21:51:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601959884; cv=none;
        d=google.com; s=arc-20160816;
        b=NjXS1yLc/h+SBCNAvmB3KpaOwFK30myOHjxr0ZLqzrGYiif4VlkMH3M1yssHMJAlqv
         As7l6r4KZ8H2bVBsZV0QPL2s8UejK8KS0V6+N+bBHIGxePunoWdqSupGOT68SWkTSUAj
         8yvj2bnAuI5lY8Ckq1MLtJKmOaVRzemHkbIUlsY2IuluuFyYltPIYzdLMzGol/T6ftR6
         89dlbVmLZ2HsJ51b0yOD6+5w4OD44v9auEu2I/oCqkND515/ToKbNTyjqVURNu1KadDf
         9jXYwK4IyDuNAAFpHvCLnJKOfHam5Z+REUvVNOkvYMbwSXB8NxLqNPEVXcRXdjzmOf4F
         DtAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=q7fHr39L2WVhC9SDHv0uH1eC3L1iua3q9R2dkxWrU6E=;
        b=BLQn0eRgrtwCG6hGUtXdKOEdeApqjxT3A+2DSpQwT1jcYQMjZktrD8WcpVTtF1+Uc1
         kOvv6qsfsaWFQFF3PIGqpQd+WRWA384zqETRi0a74IfUj2WVLveKQs2kWgMlZFPeeH4i
         lk99iXfh5fc5zW79GELPVZh04J6VmZMBl6fiFUf4HK6Dg4eCs60TMTPHIhy1RVuf7XKC
         O9ZsPlvNwpCnpAX5Ymu7Q1eCEtU6cAhFStD15KlW3t+LZag7m22SOAeqBtxZ9aPLE53Y
         DZPMbcCABzND4+0gYsTBz95WAStCjN025NIGkhP6OVZTHJHRG9riEoqIh+Uq5D8z15+2
         ouGg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Eq85PIdy;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-17.smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id d1si130421oom.0.2020.10.05.21.51.24
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Oct 2020 21:51:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Received: from github.com (hubbernetes-node-e97849a.va3-iad.github.net [10.48.109.15])
	by smtp.github.com (Postfix) with ESMTPA id DE6A65C0E98
	for <jailhouse-dev@googlegroups.com>; Mon,  5 Oct 2020 21:51:23 -0700 (PDT)
Date: Mon, 05 Oct 2020 21:51:23 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/e0d420-e3c512@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Eq85PIdy;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/e0d420-e3c512%40github.com.
