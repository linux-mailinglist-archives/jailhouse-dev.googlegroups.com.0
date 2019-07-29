Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQFT7XUQKGQEONBJLDQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53e.google.com (mail-pg1-x53e.google.com [IPv6:2607:f8b0:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD479A1E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 22:40:34 +0200 (CEST)
Received: by mail-pg1-x53e.google.com with SMTP id g2sf17704497pgj.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 13:40:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564432832; cv=pass;
        d=google.com; s=arc-20160816;
        b=TY67DZGUFUXNiY23/EcunUgIO5/Lgl5NzEoD5uWtdg3dEWY5fKfdHK/NTgQLDpFH1w
         9Pbitepl++3jopVOKzfsNqxZ7TEqrh/3jc9hd2L0nnYdVltiaqxYVsh61XQCFHJeCffS
         w3bpCjmrRr9qPexu/iOW657qq70P9iQof2+qT6x2+1dmyo614knuB4SsKk8CBfql5QZR
         nPvsNbe8+WBltgXnYGcqD5UD/Oba0HiipU4KpUjU7oLxiFNTjbLl+QwU1luRLGwkOnlT
         eOrBCedaoaf5kRgCwKklOoNuZ7+aIoNdyMD0ipxiq0uRQ0PYdsWB5xAT5CuWSWc0Bg1D
         a1TA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Fwrm9yDIORMdW1h/f8v6tZx4RHoEc6pucpUNtaIqztI=;
        b=LuTPcvgSfjf/nwiJF0PE/4IE7sI3jP7SNmSOh7EVtz28TlC8Nzod9TiYt9ZM1lOhwO
         plM1l7TTbc1QeNpKmRIF5WPo7RISsdpbeu3YIrotRV9hfR1ectJA/bwe2YJUs02f5cPx
         oG8jmqm4XP8UaYAXaBuv//2Ou0e6g6R5Wy7lUbrywf3bsOd5T+1wlZNN4xRV7GUM7mOy
         F5outbQXPCbdmMmh0czs6mSWMQU1pZefWBfHxVTrdoTH2TJENH+1h7XHY+yOIhEHaE63
         6ct2ZEBfTxPvnepOYaQlNzMDH1PSEKtakShZk8/pHAuM4Ba0RoGs37EOY8uGdlaEClY1
         ME9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=QVSCo+Cu;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Fwrm9yDIORMdW1h/f8v6tZx4RHoEc6pucpUNtaIqztI=;
        b=jc3nLL8adbEtKAEzdwlSFJzRA8zC+JtDptHLiHHcuCMuvRoPKJKddeJNKShMomyR1+
         B4h8EdivKQDH9thLNpwj6AwcbPZUpirhav2qJ0trUS40ozSD5aSxLAvn1qtCK73ztB9f
         G1WZJ0lgsmjJ6v1UIy7leY3/cYim0O+blaovXoXeSYBNnJnx6NKiMZTex+NLrR5v4lFg
         2RFuujqwhJqq7PBT4f/UPGC9hsfVHp2+GN9XlQ4VWgogkMPiGeEnlhHPEiPdm6yWBX+a
         /cP+Qxb2OFkm2OaFbSrPKdCr7dI1+f9Clbij85qVEIr71JfP9yTYRjQ2IA1fU7jchIVc
         WH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Fwrm9yDIORMdW1h/f8v6tZx4RHoEc6pucpUNtaIqztI=;
        b=AEZ1Tg4GK8G0fUF/Ax3HgUxjan+l8oPZuieXMz8C1x6PecfNRDe/Z8vgf2HkUm6plp
         n5jsqddkYDSzpajj5vNTaNsOOAm/NN5Mzw3HMRyDl8xD+SG8B0Kn1/2KjDl++W8AHHUA
         /Vc6QeNUDQUHaR//oQ4i2HzAf3onfGb+s4iNzUwomY+L74atCrmIiykTz3LZi8q6h4E5
         pcnqYOTjWgLDMXO84HnCobDJUvOB4FkEadgjoD3NhKww3ozB79EwzDuzmCQgcGSTjTh1
         dH9wP6VA7B+guMSp8gxFwdQx4dOC1jNPbXwiIW5pNiiBK8y+cuOD5cCChLqBrbzsSyoj
         mo+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWN393e/7Cydtqpi2pWwJL7RNwRsIZGgjM2tm46SY3CJwZtHFMa
	UYNhNtonXkV2wKAJXPA5/B0=
X-Google-Smtp-Source: APXvYqxrcuZhESu6dxOGQIXvnlM+ZolwEYURE//5CCYtttwfi699O5r7igkGPrs1l8xk+ldJidrkqw==
X-Received: by 2002:a17:902:28c9:: with SMTP id f67mr72933538plb.19.1564432832763;
        Mon, 29 Jul 2019 13:40:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:a70f:: with SMTP id w15ls17472104plq.7.gmail; Mon,
 29 Jul 2019 13:40:32 -0700 (PDT)
X-Received: by 2002:a17:902:54d:: with SMTP id 71mr109263792plf.140.1564432832284;
        Mon, 29 Jul 2019 13:40:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564432832; cv=none;
        d=google.com; s=arc-20160816;
        b=ecChZlclVgUgjZIJj+ha6YdcndDWQgUwGKDCip8i5XGabECn60HS53FFSTWBqUrxuN
         KPKdgIFh8HlkzIr7bp1RTIv6WOTTjbDymPgbOxwEa5jLlo4gdQ8hiFFZRE3OQzXsj77m
         ip6/++NsjPyuKXbKp/5WdvnaLLXVG2b0rF2ejRJjlZsIbwkZgKui6NV7tFwB3I8sIgDE
         V6qfi1dtpejQqoKHW46ZAdOcSinSNG/FS9+AQZNI2LjC8aChinKHrU3SMxBCK842ZiUt
         CjFoF+i6lbTypYweWcVXm8XQ7Yy54OHYCuAeu84HzE8vqo29cRXp3WceAzoT5mT/9cu+
         hSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=8lzVBRzubeTsNG2UmOPNKE8RcqK4A7QAlmTr++SNTBw=;
        b=I7reK1MLS1ZywR4h7ob0kFVjlZqMBQxDusWB4zhgniL1U8c/5UfvXBrvo8Lm5K5INo
         oRKKbYhvaDyBfNmZDMszBtJJzSIA6qdyj+8VRrK6XjkEel3ddw3I7WGbEc9NIHu1R81d
         hTmw2OkXehoo1zKTl+YwfkCoGTwV+fvDp1vOVMVT9omiRyOfmnSvmcPHuO5HjEYMoe7T
         LdZ9Ek5qlewd95rNIIPcS9sGGySliMzgB8oFbcYgZIM8VerKMk6VnRjEt7DC/IjvvwUK
         7PoaMATx9Obr6nU2BKY6EX9f5K5Oa/DoYM+iFDeteIpM07weOecwie4QCmWHBToghkTx
         x/yw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=QVSCo+Cu;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-15.smtp.github.com (out-15.smtp.github.com. [192.30.254.198])
        by gmr-mx.google.com with ESMTPS id h14si2723484plr.2.2019.07.29.13.40.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:40:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.198 as permitted sender) client-ip=192.30.254.198;
Date: Mon, 29 Jul 2019 13:40:31 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/dee9b4-55de04@github.com>
Subject: [siemens/jailhouse] 55de04: tools: gcov: Fix hypervisor image
 signature check
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=QVSCo+Cu;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.198 as
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
  Commit: 55de0454d880b3094f46f2aecdd4b696a13c7fce
      https://github.com/siemens/jailhouse/commit/55de0454d880b3094f46f2aecdd4b696a13c7fce
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-29 (Mon, 29 Jul 2019)

  Changed paths:
    M tools/jailhouse-gcov-extract.c

  Log Message:
  -----------
  tools: gcov: Fix hypervisor image signature check

The header signature field is not zero-terminated. Use memcmp, just like
in the driver.

Fixes: 646233947717 ("tools: new tool to get gcov data out of dirty firmware")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/dee9b4-55de04%40github.com.
