Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBANDWL7QKGQEHO3VINQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x740.google.com (mail-qk1-x740.google.com [IPv6:2607:f8b0:4864:20::740])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B7A2E7A03
	for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Dec 2020 15:41:06 +0100 (CET)
Received: by mail-qk1-x740.google.com with SMTP id 189sf12883029qko.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 30 Dec 2020 06:41:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609339265; cv=pass;
        d=google.com; s=arc-20160816;
        b=qQGWxcFqfpAC4aHeJHANdI3Cmw6GfObljtQp8TjYHptKVaO2J8jxEdXJ1T5LKXB0Tu
         OTcfO6e5zblk8Oc08BOG4i3C/4S+f6lQA97zI5r1/kRM/Ezpa67HvwPpXfvIyk1Ysgt2
         APIQoMG59IOs7HWFb5e1bsqRZ8PT3kZeTlU1/U4qnc+4nIcAgUaCvZAr/0oZoRG+vl8x
         je9NUjLammSrcoea59jIE6ipI1dZuQJeIniqWSR+BQO+UvCYaRjnGnoP7bLi/qEO5u0Y
         YHhG1nyueiZJqceldN4MEurCc2W7V0HcFQdRSMY9TE2qEg7NOZtmZD06rgnLue6nQGeq
         Ubfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=4nEj5QeKYap0jy4Iks0/wMLvpBw/hyzMCeM8jaTj0ec=;
        b=C2s5+8ykM5VJEilPf852KC3RxLl6whZwgg8+nkTZiyX1Z9qrD+s0DY6WCrcMDhdaGz
         nDmftMDqKxhb2QNyCrKyfZX8wtAh9R/A0BoEQoQ0G61Nqr4bIAdO1aWr2m682VZSU0hU
         CW3BEUv71AT84FN45fRl9nRop4McBehn9FESOZohv9vhEcmtuoTxjRn/87UgONNE20uH
         P6vNIqsvReYor+AGQ8j0OlB4iFrgHxoeoxjPMaL0gCwsjUWcYgmcCWqWCdCidoNZbIel
         ppYnzHuxiadodChagTufjPq4dLyt1U+ls2M6+wZcPQ2zU8wdwV1hH98mS0T8o2uwl0Nz
         jgHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tifjw6GY;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=4nEj5QeKYap0jy4Iks0/wMLvpBw/hyzMCeM8jaTj0ec=;
        b=fXZoQopD5aWE6HzEQLbMPMvX+vGZPCc9UwGH46gFMu/q0e1U2N/ifY+xVqeIdgu3Xi
         P/8Xft0mW1fRvlHCuJjjan6EXNfziJIxKkESvTQvvCRr6uIyr16R9+dxZqISfaT9fDmg
         Tr61RgAvBUPb6CwujSI3e23XNbcJE1DSEyzS0dAr1s81yNLLXziWft9iNmNVF96kc9De
         pNY0R+JO47/RElWtEFwPjFO6fb9DzobFQXZu64DQWTo32cFQFw8Mpo/NhguxmxqtuqLu
         kFlC+UL8P9NGmz9R8ws+lGNr9CSVCAhTYIBCmhI4oQ/toRbPo1SbTx6mTHIb8sigVWdD
         xE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4nEj5QeKYap0jy4Iks0/wMLvpBw/hyzMCeM8jaTj0ec=;
        b=QVera29RovDeZCRBm1NCkk8BxfNTvWrVQ8nNIbjTOn7cOVtKSSvwtujv7sLcJE9uKa
         xsOMM9rd/Ix7dvgjAGve+L0wXpeYRjHz+YLq9odmMi28qGzAhs3CobUXLVNGE2eojqk7
         VCdWMuYLQYo9AklHnjA52FSw1me53H3+9huXUMxXKMh7y0w4n3gXJ5YZDYLrasQGIUzz
         zujSVYL6+0VJzMW0OT/3jCI3UY/4XsBBW0WhhBbByOBzh2lcwoknFV4H70GKlzptj5Yt
         RVmXr7e9CKloj1mBrL4/N6ANCn7Jx8+CTUfSKbfFmTliOi5NgL17lE7hBKOqNpYgQsYd
         daGw==
X-Gm-Message-State: AOAM533+OynBOhoXrCPcuBtMfN/Jj6Srs3qdrqvjn5Wkgp1geQAQYzIl
	psyKyb989OfAjAtHQQJdp58=
X-Google-Smtp-Source: ABdhPJzS/Nv6V9bDfMx6WAJnP+9/LdlMju+7TVxeiP/t0kOQTpn9n1GB/YLWz4wuo/J6hwxv6B+q8Q==
X-Received: by 2002:a05:620a:39c:: with SMTP id q28mr16365338qkm.276.1609339265647;
        Wed, 30 Dec 2020 06:41:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5a53:: with SMTP id o19ls19873210qta.5.gmail; Wed, 30
 Dec 2020 06:41:05 -0800 (PST)
X-Received: by 2002:ac8:5806:: with SMTP id g6mr53233192qtg.292.1609339265079;
        Wed, 30 Dec 2020 06:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609339265; cv=none;
        d=google.com; s=arc-20160816;
        b=mwm955d/ooM2JTunRH/qjviIJvV1K0OLy78lSDEmu6/MNKi3h7Fq1lchBqI/A8CdQJ
         uRWXI7TOvUEL9U/bZGAfn4R8GfIV1f9bWY5QqzD5sKZWp269zmoK8nQ/wXIB98CfoFLm
         CBVmicX8bb2AXmtjBbvRPuZWa6aNfSiQ1nnTAm/hROLext8UCzNE5R4WjVHFkb/2hE3s
         gUR6RV+RzdAEg7HD+kHtCg3gUK8ig5rzi9fpMiWignP6tnUIXMosiDmYJKCPpnavGtHt
         6xMSWQM9XWCldefzllA3y0snUlTZzghC1P8UhwFprpTGdgPUVbbcCf8Wmn9sxtLCHDbw
         1WYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=xJLnSisR9tv3A04+djOZLzPKsXfyrV9O19iUwv4jI1s=;
        b=JdKBsWRQXUo6BmEwFHTDj4MjMkoLXvL8GGX7Z0km102jxBfZRh58p2gPAiCNuG+wtk
         GNAg6boQCOLscfMDeOn7ye/0hotyfrAqViqNKKhSbdj69LzGHqRZvaIz97j5XkBvVCd6
         eQv82F24Y+q+dNwRMwKAx8YC7Ggqc6asALhgT3PTE66096IAIa72RU43GALz/aPFFOsT
         6fU3RrsRtPQJTGnCVUb4YDwh3f3DblSEfVFQYEbf/EU8WTYex3sd9qXyfqjtAu6raWr7
         0ABrAiwchYc0XqII4plvk6D0I3+wuhaA0GMuab2a5AhAUxY/4UcaJAyigpMZa+hwQJvD
         Vt6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=tifjw6GY;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id p55si3015769qtc.2.2020.12.30.06.41.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 06:41:05 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github.com (hubbernetes-node-3734f04.ash1-iad.github.net [10.56.116.28])
	by smtp.github.com (Postfix) with ESMTPA id D6E49840AD6
	for <jailhouse-dev@googlegroups.com>; Wed, 30 Dec 2020 06:41:04 -0800 (PST)
Date: Wed, 30 Dec 2020 06:41:04 -0800
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/3cf261-5c5cde@github.com>
Subject: [siemens/jailhouse] 5c5cde: arm-common: Account for SMCCC versions >
 1.1
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=tifjw6GY;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
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
  Commit: 5c5cde20c9a855224aef052d9ad34a60fb98bcea
      https://github.com/siemens/jailhouse/commit/5c5cde20c9a855224aef052d9ad34a60fb98bcea
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-12-30 (Wed, 30 Dec 2020)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Account for SMCCC versions > 1.1

We must not limit support to 1.1 exactly. Anything newer is fine as
well. Required since TF-A 2.3.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/3cf261-5c5cde%40github.com.
