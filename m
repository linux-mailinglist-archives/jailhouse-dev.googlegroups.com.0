Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBRVHSDVQKGQEJPI2VWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33f.google.com (mail-ot1-x33f.google.com [IPv6:2607:f8b0:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C46F9D4CC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 19:15:52 +0200 (CEST)
Received: by mail-ot1-x33f.google.com with SMTP id a26sf10470071otl.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 10:15:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566839751; cv=pass;
        d=google.com; s=arc-20160816;
        b=JRkz6Bhh97RBWJXkprgf4c2VWyJ8RpBLsnpPGXjXYvQE9PM5ABzBDeRDlK8bsJpmSj
         Vl96Ouk6iadIijG7zvXD+YIzR/zf9gaS4Ptbkejh/q74oMc7tOhgjYY+Z2wN3zRgEToV
         OzdzytWiN3bwqkFIsqWzJuEs7IKcdbyo9nFK3RvHqpP9k9VX4wahfr1o98VoT0CWYdyA
         8zSj6feiqdEGxH1JqXZHmI2edRXURCvG3pRxP9ea/Ouh60TCfSVuwaD87yTLNF7biF36
         sVaJPEYk/kXrhtWr3VZtA0TNNeweabmYQLZ8LQwZp8QyzbE5eAVJtGoQQZUXj03P05xh
         7s8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=/P0y7r0LB4xnoGL4kRRk4TMP7uotCxfmNCeE7RcOfZ8=;
        b=nLcM+fCgWiWzojme3c3ijYQhOaA1bsaCjd2Gu5GCs0VYKzJQK/kOvJFHd7GQCrTyd1
         jEXVbq4pXEgVV6y9Xh5ZJ8VHmpwBLwxByM74TLpe/1+CgtJIou2LGbq8zaIswa6f4E4L
         0Q1WqCwsjHg+4Joaf9YDhnqXahAqcZmF5VZcwntSWAyFD/079e0Ul39dN2s45F+dTASt
         UIAbR7QOxFex3PsrNVF/4ycBLcaZqODpw3reFZQX+uzKElRskN7L1POo93cHr2Kz/Vf1
         z4qUZ6c/shRHB3TrsdWZNXyDClskcBfGa0ZVZVttYgjEIn+i99CkPETY4svlLWOsHAy5
         QncA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=q0ywf6vP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/P0y7r0LB4xnoGL4kRRk4TMP7uotCxfmNCeE7RcOfZ8=;
        b=O1fBbsq/ORLaiEjtP7EwDSSqv5T8ytD+yTlN8Cu/u674ZENHri5Vqa3DW5XInV0rXr
         CdHpVAh22K9QloOoU056kP+raiX1DHqErrXVnzPCJcTZeAfDjE5uUoGP1mYFr/8Mgc2I
         QLAPLbYHy+BWBOhVqUgEKMVCqntVS/K8YgXRGkrfNI043JfHFaLqqYH/hglv0LiWlGFE
         BmmhrwnlEtDcYSvifBcz4zGFBHd8bfxIl6qMobgNNY25g9R+eIYGSisLEZ4ea1X43SCD
         MyYzyiDq8reMBRN+4fxTFENC2PqtEt9HFFyBuzfDsASM/kjtsa2mu5MXANfMCWc4jd1t
         lFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=/P0y7r0LB4xnoGL4kRRk4TMP7uotCxfmNCeE7RcOfZ8=;
        b=QmQBS/cmGV7xHRhr3Od9ccrKtF5QkYxiJQq79Ssr3ry6XUEMZ8+qdCCRwxlH8y+FAf
         7FCWMAsNZqzH9vdAe2WPV/1uveESPCYi8jB+UA/78T2++FSduwR13J29AouyUVDYKVM1
         6Y1xI1/Zssiij1G4sSz4KWAXNVI00shQCRVJN2iQO9bddTfrxu/mYLo2nJtZO6mniEgJ
         5JJmTXPOY7JHSWFUkai7EVDMOYjUmqZ6/SdOp6b5aJGBbDaAxXNOiwHi47+Uzp3ROZmG
         uCVCxW/skXCUCNG9zFhLx3u4/OZV41yz6/5coBHjiKE6053BeX52V2IxujeeEDP2Dmbz
         Iviw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVCrFF3s+X1hc9j/p7TLwrDASRyKAXtT/hx8Ke4u5V/pPCUsQo0
	q5V91zKFwYor5HwnMLndcWg=
X-Google-Smtp-Source: APXvYqxI4U2QPCm3z023PXWHT/gmPZsGwdz9amHG36REzpOknzIQK5qn83F3fVXAb6QNnfivHw91tQ==
X-Received: by 2002:aca:edd4:: with SMTP id l203mr7033271oih.52.1566839750972;
        Mon, 26 Aug 2019 10:15:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7441:: with SMTP id p1ls433828otk.13.gmail; Mon, 26 Aug
 2019 10:15:50 -0700 (PDT)
X-Received: by 2002:a05:6830:130e:: with SMTP id p14mr16678129otq.339.1566839750585;
        Mon, 26 Aug 2019 10:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566839750; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8yS0ad+5/DFg6tCPPrMJsgeHw+niTXlcsDsByNT1gxKMMSGrQVqp3X4gTFmkQzO3C
         qnzrPrm7gffWlvNgR8XBqxo5Xq0vzeCCUN6zO52bZArj0FEnwGN7sVNyfcPXBoLrPjT6
         TlzSRnkK16me93ogBQAdZB1n3jYLMRTUfpJ8RB1mjoPugvQV9nZ+ZSF7o19CXl+P7Yww
         CivqkN9RAPDJuMIU+zLjJTsuMU0LqAhLk7pKVBhpUHXIk6KMbDDsQ2nS3O3/pe7AC9U4
         p2yqGoEIL+FOvSXc5hDqtM938LX43fhBs14Q+EaKkDSOtXcreK5D3e8fLOb3FhEhYEOd
         Gubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=bNOutBSVlcTqDW9t8CZ9Q3iWeltLPpg9bbh4T5Vzmf8=;
        b=vtN/OtPcQ7CZg2h9fCRZgYdaUk4DFpcRDF2wIHYunzZESbE+FbkHaQsuVNy9S5gVn5
         SGyxj/iy/FmlvdVATecl+BrV697FhhLZuiLbKdVTFzNAqU/93edZWRZtlKx1ShsWW+UB
         JuFMLlbcxyuYxFB3PlSmWMqF39G3nZOy0ccNy6dbWs9OCLH9JcZqKstdWBeLrC68G+80
         2vyl3URy36O7avko3lmcia3osQw5u1NpAMJ0o4eKkqbWGR8zJSSe0eLj1G40mw3FkxT0
         kBQ5xI65oAn0I4GgGpN/6p80ZZMmjht78zpvHOjrO2d/Ns5qNqAo0nVayiL1FVyRX1s5
         RyCA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=q0ywf6vP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id w131si538079oif.2.2019.08.26.10.15.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 10:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Date: Mon, 26 Aug 2019 10:15:50 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/8e77d6-aff3c9@github.com>
Subject: [siemens/jailhouse] aff3c9: Extend page table size for arm64
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=q0ywf6vP;       spf=pass
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
  Commit: aff3c91f5c46d1be54c65c00328d4364eaa94fc7
      https://github.com/siemens/jailhouse/commit/aff3c91f5c46d1be54c65c00328d4364eaa94fc7
  Author: Oliver Schwartz <Oliver.Schwartz@gmx.de>
  Date:   2019-08-26 (Mon, 26 Aug 2019)

  Changed paths:
    M inmates/lib/arm-common/mem.c
    M inmates/lib/arm/include/arch/inmate.h
    M inmates/lib/arm64/include/arch/inmate.h

  Log Message:
  -----------
  Extend page table size for arm64

On arm32, the index to the page table is 2 bits (bits [31:30] of the
virtual address). On arm64, the index is 9 bits (bits [38:30] of the
virtual address). The page table must be extended accordingly.

Signed-off-by: Oliver Schwartz <Oliver.Schwartz@gmx.de>
[Jan: style tunings]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/8e77d6-aff3c9%40github.com.
