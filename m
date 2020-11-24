Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBVGF6L6QKGQE4RABDYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x640.google.com (mail-pl1-x640.google.com [IPv6:2607:f8b0:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1292C1DCC
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Nov 2020 07:06:14 +0100 (CET)
Received: by mail-pl1-x640.google.com with SMTP id v8sf12960980ply.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 22:06:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606197972; cv=pass;
        d=google.com; s=arc-20160816;
        b=JLzIz+9z43HVPvHft8onf1ZLCwK3M3ffwY11q+MHcBe+bkAufj8O5BVuXStAv0ocQY
         CUNIUMCMcCDl2KjnRbCdZvZ3cLZENardrrCyiUvBt4bawn8223tF70AFBIRS8C3KKHDo
         AvdwjcCJdhjQnTsGaziqxXjaiXWK8tmRrRnl/YPpmpPcEGkyVkB8AhFcsim7ipB94Z6q
         aSEje43uyIdpc9VgieTsqblcn5p2rftq8L5aE9fJFmNxHntLLlTbUjXV/VuOTehr8g+w
         XcGGqbnbb9nzc5cCBdwBWFpnOaagvLha4/kk2S1vmJwMyiXFcDNsyhFB1Iwa7a/72Qpz
         P3Tg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=9Lv5uhq0RYeQNzRlleTOsRYg3JYxTHUAIV9pFAV890g=;
        b=ocHaasDihK9RLZDniLoe+OFKceByksP1SDFswS66UdLBAIkwyuNFtQmcQY4+PnWYzj
         m3Y+RJA+2xVdaN9t6zl3O2+vsNDWi3scbFQtbz5avVmUDQ2QNhHKZRdL+cS8Xy5dE9cQ
         FYcfU7QDkw+hWBGeSEkT7KhKndxCpkKo3ASciuTlfyzPaxr7PZzLalUx7urMB4wieJOl
         RfsLbWAXQnUf0IyumhsZE5nGvCO51/9DQb3qOmf2S8JW1ERppDl6jjhA+WQdlPxOohtd
         3eFXKO7LB76aZrvfSsZiTkKPFA1sQgIQ7n4UGNUmZ24tglxxinBumDElw1vRB+eJwmL1
         6ygA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LDA3IFOT;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=9Lv5uhq0RYeQNzRlleTOsRYg3JYxTHUAIV9pFAV890g=;
        b=DzYCZFQv1lo7FoW/YjIIlwaOsX0Z4xs3dLHuvxlJ4eFDjcD5r7jcxPL1GKxijtodhl
         OMpWPWYbGSmW8z72nBKRAkLVSAEY5X/131108e6EdWeCIlyoK1HWeSu1D+hiXMZKSJjs
         Jq+gvWZG+JYSQFRU2PXxgmHx4bV4+H8AGLIdHWlMv4VY4hfUbX3+t7MOdzJTirmzIRqb
         3Ur8Slx+z3Lz6tXqPf3nzqHXuIDaAsQEwyGW+Gc4Ks+/gv1jSqUwZNF8tnCBvGuGKQEw
         tc5X5PypJP6XCesOduluBB1hHi6KQESqDBf8xI3ucSj+8dc5wNmbyNwIyObC7vXZfQyT
         U/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9Lv5uhq0RYeQNzRlleTOsRYg3JYxTHUAIV9pFAV890g=;
        b=uAfYhZ0YJcS8lLWbKrpj9akCxFQ0cDsJQELYswFpG7CtQOHunKGhCX7EPNfZbdQDIq
         u5qlImDUvAyjsQK296uxVPTvFKIx6DSZJ4Ql61r7LW0CRA0YVy7nM5vl/TkcJvbYQGI4
         YxjBexcagPF6cniX/bmgAGHJfwQ04pFP3ayo7fd52swd83lB/kVUcu6B4oaKC99PgupF
         oe9Bt80F2GFv2S/w0FFry7j65hWpSVHRzZPzChipmP6/ZtWCG/TExK6Ldf8NLzZgsQOw
         b0Vwvd7qo8pvfWjzhJacU0eUiCoIxlJEAdOiT9AkdksCZA1IX7zVRQtWEnGU8w07/Zsz
         wmrg==
X-Gm-Message-State: AOAM530oLEZMu700HtXlDlBdhgKLSm8BMY/DpSiUImhD+3PH0nIa7nHJ
	21Br8tSsjPuKdnVK2k3CeE0=
X-Google-Smtp-Source: ABdhPJzoJx6E+UFHimO4GQZ88bA/0YsglvXR+T5qD79VyHfTP7p5G5WdwDI/E/5w5Kt6cTlz5TtI8Q==
X-Received: by 2002:a65:520a:: with SMTP id o10mr2486910pgp.413.1606197972511;
        Mon, 23 Nov 2020 22:06:12 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:f601:: with SMTP id m1ls5351717pgh.4.gmail; Mon, 23 Nov
 2020 22:06:11 -0800 (PST)
X-Received: by 2002:a63:5315:: with SMTP id h21mr2579974pgb.43.1606197971616;
        Mon, 23 Nov 2020 22:06:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606197971; cv=none;
        d=google.com; s=arc-20160816;
        b=T2YGw4hh4/5KPfX3liQ7bqwOvSa0JwEtS+RIMrvhBXymt6AOKYuXxPpSoxLOwVaK83
         mw98CWqmGtI3m8l2cHhCdbz57eVrapS7IXRP6QbZ9y9PWMNAVl3WleOqLiSAPWL0PE1O
         1YU98T0GgG4TZXrUgrThMgkG4+YC/JIwfTEHxfv0Ah/ihQaNbuGi0FAL7yMnGHD0J0aJ
         wIsxkXOfz+5upNvCyucU4GEaIMRmrtDBOcUz3UJdzvAr2/VdQDJ+9qxu/6k5y+WfaU98
         RHoPHsEJsaIsVcmQXPrCJfoQblTF9xOK7zo0uF1yYvgPpRijhnTgvzFxdCQt9GyxNEIp
         GdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=kxTqLwJRnyzpydufhl1QQKoBhOq+YNhqLek0dnDpVNs=;
        b=b6Mtsyx7GTgu9tFISWyqk8pwBXb35jYNC43gstuNDR57QpgedCR3wYw2YhkZjUzB2e
         Jn+e3wOaStlHq40k2+at450KBlYBwWzNgQytGGZlEHm/P+Qa9dI1yyzGTPODCl69rEaz
         XZH1+9k9qCLDOoDocSL6et2B+4MpLQ13ivki4YO321FgH10Ws0hQZ7ak+s10j9OcjkO+
         4aoHMVTkG/x5VbUm5wiM/ho0SzzIiTLU0lRVj3VNyu3pjwNYcR8jjFlApzX67s/9ildJ
         yn7FQz9uAcvsQBYwAdCr691h5DgeHhfsxrnDQpVCfZIY/+iukvJGGo1wS7i216VftsgC
         arYQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LDA3IFOT;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-22.smtp.github.com. [192.30.252.205])
        by gmr-mx.google.com with ESMTPS id d2si1100356pfr.4.2020.11.23.22.06.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 22:06:11 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.205 as permitted sender) client-ip=192.30.252.205;
Received: from github.com (hubbernetes-node-d8b14c3.ac4-iad.github.net [10.52.18.50])
	by smtp.github.com (Postfix) with ESMTPA id F1CC856008D
	for <jailhouse-dev@googlegroups.com>; Mon, 23 Nov 2020 22:06:10 -0800 (PST)
Date: Mon, 23 Nov 2020 22:06:10 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/097bed-5498cf@github.com>
Subject: [siemens/jailhouse] 5498cf: configs: arm64: Fix build of k3-j7200-evm
 dts for ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=LDA3IFOT;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.205 as
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
  Commit: 5498cf9f50136ce16a661677cdc1bd3b35aa03d1
      https://github.com/siemens/jailhouse/commit/5498cf9f50136ce16a661677cdc1bd3b35aa03d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-11-24 (Tue, 24 Nov 2020)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j7200-evm.dts

  Log Message:
  -----------
  configs: arm64: Fix build of k3-j7200-evm dts for older kernels

Went in unnoticed due to a reporting breakage of Travis-CI.

Fixes: 4fbecb507cd2 ("configs: arm64: Add Linux demo for k3j7200-evm board")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/097bed-5498cf%40github.com.
