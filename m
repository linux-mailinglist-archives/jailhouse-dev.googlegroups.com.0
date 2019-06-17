Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTUWT3UAKGQEIBUXBDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53a.google.com (mail-pg1-x53a.google.com [IPv6:2607:f8b0:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 40096482D6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 14:45:04 +0200 (CEST)
Received: by mail-pg1-x53a.google.com with SMTP id e16sf7691894pga.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 05:45:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560775503; cv=pass;
        d=google.com; s=arc-20160816;
        b=oyd1BFy5EE2vf3GAiY5qxhiXxnm9w2TwTi9PkaksCz0+TRH1KC1DSv0BAwtxjHdprh
         UcWgPY6HBK0x1lyTrwmFKDIjnXoZopGaG1qf6WeRtl2XeU102UNxRvotjzN1ybxK6mQU
         kaBgKJWNwuNwIQut6mOBps8b3CqIPb3DyyINR9dOqV640EASZjTAmw8rcXNhx99zvM2a
         TU1AWZExbS2NIFkqAuNj+fGrNZp+QgVJp1p0beTRCnjFjFFMIPo+P0e8s/om1zCQfHpb
         w0t7p+p12704PekkUiC+onaVLmPnevCkMcjBCL/SyT0EiDbN3/wtzDvUmfp4/2UTZt03
         GsSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=q5U42diRGJNfU6nQmKHN4MCVd/zc5sHsWMVx2Hzewy8=;
        b=dT88H+y84KsYRHsXn6Cy5pIwGgbFWJE0HVJuvHJG9WpwwCBeetEDWQq6GW/yomMdLG
         ZHZL8Q+CCyxTLEsh62qAiiEpJ1iQDKs6J4UKm7WiDYRI9aMbyd3834AHOzPPvdY4d71z
         REDmtXp1+EVzTjTMo1p8Bue/hn2/+WOKWvWIrpgJxcHkYXj4N2+g8tLRLQqMNvjQo/VR
         jt2eT5Q0bm8aBkj/PNj5gnZC3ueQ+h+yIqHTmwHagIikI+2HR5a4cedgycE+6tRA4juU
         ZtJd3vCKMeioMX/aSlKjk5SMNgFj052w5npNXDHve/GN5yge5hCG9kBZDK4YGUxgMr87
         M5/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jFRb0lyU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q5U42diRGJNfU6nQmKHN4MCVd/zc5sHsWMVx2Hzewy8=;
        b=hSy8s/ciqpWc2IDztRpjcl/qwYG5xArg0kljZJrpkzYNs7NO7/uvmA8S6/oSzRQssl
         /h8DwnBrFqC0M9YCyMgogb1m1kZUhN1mGzIk7dhUsBPhm2TSRdGaOT/HE/U833wE6dQJ
         nLKQbxQUKWsbWqAyM5bYH0DlCAt/wJleXyWe1RPQV6Rkw3W2oedVttO1TxQq9Ft2EXsp
         yR09ef5R1+zFVmiOEL7i5RvADquPxDPx2llJhk+h9Uh2Ou51Y3xhQKvdmWzGFiacI02I
         Cf+sJUg2XPWuWEvP3I6zxLoqMnhrgfxjn2rmU4AmjvEtNj6tz2XR5QWjixOglwWZYNRd
         l93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q5U42diRGJNfU6nQmKHN4MCVd/zc5sHsWMVx2Hzewy8=;
        b=cb3bd6SUvYmcVvBT+AA0YFVubj6thj5pCQWgLz0U6Zy50GAbBs7sAJLAeIBnmdI5BU
         34/5rTJmnnSdGKhL2ILW7XN2SiPhhBRP6F/RHiOwkURXPb6JFFUnNSO8zCyiACOOgNtW
         Ee7tI0jYlHJW1VmD1wp+dc34narTknQakYIUIov3APQmOfxy9eMdOgL4Xrq+KKcnfdYq
         VhtrKiDTi8lh8yh2JuqXe4vonORjG9F/stnSCE4XK8Fzr76wVPIwYinibPyxkoO+KLWp
         J+9j7ZnPWSxBWYdxQ05ZEUHHxGuj0JWuqUoLE6AacxPt6fRbB8jQNdP38qrDEzet1T9a
         71ig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXUzcch0wfbhSZD3QiVNgi6WPSMpfPBTGlIWLItYSpXt1M3Lu7j
	Wq4UaA/yLWE8d97JQEOcoiQ=
X-Google-Smtp-Source: APXvYqxjzJCr+IYYifHjjcpJ2gKeM99EsfGW2JbNVor1XGSbJ+LJYuqG+hNYQ/5XL6dp9n4jF3+khg==
X-Received: by 2002:a17:90a:a10c:: with SMTP id s12mr25850826pjp.49.1560775502748;
        Mon, 17 Jun 2019 05:45:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:48c3:: with SMTP id o3ls3272062pgs.2.gmail; Mon, 17 Jun
 2019 05:45:02 -0700 (PDT)
X-Received: by 2002:a63:2706:: with SMTP id n6mr50876156pgn.238.1560775502212;
        Mon, 17 Jun 2019 05:45:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560775502; cv=none;
        d=google.com; s=arc-20160816;
        b=kKQtWRIWKjXigHkMpxGGgN5/CQV/bUIbX1xSIwL3dnWqwCynvdP52qP3B3mzlh6YNQ
         adv9ey8oAy6ja/DxmgeOpjDkaHJ4+iWEsK1+/VxkZEeUfQv0iKIFkkdYlYIbfdrquN3X
         L3yv58LtAyPDiNLTHWG7cfNhrehoI2nM7KmUNEJBy5W5ejYefivaDFI43r3uMqL8YMF7
         D+ehdm8LsR+42xPr2N10Q8lJEHPWcIgnpv1wFwp82/jxYcNoaBGhbRjX542Wmcld2ipK
         Id7JXue/vEqd9lALOXckPxXYkEz3A/yyOIEje7NbxwJhi0GvyEKkSBJptennD25jBcAM
         p0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=q6sNFTxHhkF366VfZVY8DeR/u8w6/mOaGniycxKbcAQ=;
        b=JQAjzIsBuWkrZjuaYuOcFYcnhOeCbEsDR5lLEwyQJ8ISAUsgRZs6+t6Z4I1d9Sp64c
         IdLZEluSCyHQjGn5O7DMgbkupPgL/U005H0rYtwieX/oQzX7kcar9fDi3o5+mDUlm3f2
         7cUGNMF1RaUznFXywEzVarf0xDgF6kjWkVDbqKsTqWoiVQiYD0+8LR1kvCT4O1l2fB65
         4ahDxQzrHoyk0EMsnr9w7va6OR+heXySoMn1nq5Mlm+D2lrqzdWfhxj5NZnNj+YDv8c+
         hAwzmBl0cjgLyz6j62+V4Kx4x/xgIfa+G8y4ZjfZec8al2wbY2eau5RARptfki4hRLMg
         ApAg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jFRb0lyU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id r1si589248pjb.1.2019.06.17.05.45.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 05:45:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Date: Mon, 17 Jun 2019 05:45:01 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/4abf1c-0238bf@github.com>
Subject: [siemens/jailhouse] 0238bf: x86: amd: fix comment in MSR bitmap
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=jFRb0lyU;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.193 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/4abf1c-0238bf%40github.com.
For more options, visit https://groups.google.com/d/optout.
