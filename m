Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBO5M7L2AKGQEIV5KBPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1E61B1EF3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 08:44:13 +0200 (CEST)
Received: by mail-ot1-x33d.google.com with SMTP id q4sf11333358otn.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Apr 2020 23:44:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587451452; cv=pass;
        d=google.com; s=arc-20160816;
        b=M/kqfCGwPY131YrtCW3HfgQBK+7KFK9Qv37ytUu5vanwqEkopJi7B7mCD0DNpgWTo1
         K5zC9TkJ2IqMva6DTFJLEkvoDbL6264FCOsgJuIh0o3ZsQB5CubNlP9OhSWOx5R7c0Bi
         dC1GQPOuFbh/5Ph8sbjRsuHM3e1XYDxZswJ+W1hI69YUQkpUbgPTlu583cCSnmMGLZcP
         msu7NDGnNMrUlTqFTQ05N05+czV9VNRXwF3rK2GliCEvCwqCHTp0ZEQb6AjVIQDeUMUt
         4jf/OaBUw9cj4AXwaYc5lC7TXk3B+uzNRBJNFaHFKLNm9Ja6ypAEyb4XXsHwKeD4XjUa
         oCqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=i+EH6L8VR7RFWk4sacbWKULO4FUSBabRb/uhYNC0OUk=;
        b=cbOZSlIAxS8O7tUt+kFy0LuB0cXXc6HCrhwS+dbVWTxTaw21YZ6/YFlLeZCpUNxH2U
         XInTzx2jWnUkibLtYrJWj4qZrqTUCnD9uia5GHTxB7RWnvYEQfZym3O5dqoNcrT5lLtQ
         3aBk4ayGII+hte16Sc9N9aHixtYSy28VJC3+nPAhrpi61DP+Kjm57h36Rqc62hSl3P49
         GqhUDdItYJN0jwGIi5rVGiTGZGU7w/ajeOsWKiZ4yYY3tdts7OfbLJ30Rt3zcOXniFDG
         Z+kmg1jFJfnm21G70lMc3Iv7WiQPCWUmBe34ZXPsVuR53DnMAHDn70sERC//ake1Nxy2
         7sxA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="Q/aYZf7H";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=i+EH6L8VR7RFWk4sacbWKULO4FUSBabRb/uhYNC0OUk=;
        b=e3WLfFAwMtDMjdIGz1mRZ6HzmyOigJZwAavchG6IejyTiWHe8BDQavSnMPBIi0ZuPt
         vg+txFzveV0bGtKbcA3PoGgINPW5nICrfP4n6c0HeaGs703GTMdvwGi3PuCl7X/Aw4Kh
         N+UzxFktl4QnuaqqtQ5imxm9oWvVkrdCUBFcIpmFcpCG/ITs7KMXsWAKxvBFz0rBky3a
         JDFhaw74vyKSlDKD4AbwKjQqCHHAoyl/IjUSl6U0aC/H3Vz6OnDsXVE0zeLt2wRMaV1C
         R9oR7RplasEPw7YVeml5KOue0l6krH04uz29Uof6FX9D03lufo5dopkErqjcluqwc1D1
         +uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=i+EH6L8VR7RFWk4sacbWKULO4FUSBabRb/uhYNC0OUk=;
        b=I3MAstOpJKHxnRWbgKzZygs5YAe/upfnkhPNy0bGBYlKrz5fKBRm45t394d+Oo7lRF
         2x84wYtnzz6udR2kipjM3aHnKHCcYVKUC3x/URFYp6UR9XCue9w7mjyVLNns0hCEuysi
         opcycdPcDFC54+duX5V8KfiRAr5Lr/5B9gwa/X0yZgplixL7LMGrYoNPWN77KVbD6pU2
         fTCVWefR3LlaRWSC/wha04EDGNFQl1XZNtpWlaI+PFHE2/3GCPzpgshFbfr3idU/LB6C
         aT54OjhWXOzdWq76PAvG1RwqeLNoQJ4/SwVGub8oSuas6ZOXn4c+BZZdiaOcDGHS9nEq
         9irQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubeN03KgFp+dFp7IXIqT3f0PfA+7OInBCG+JlKlP1XSw2VZU4fj
	kCfVkEIABeYhCRhZMX265Uo=
X-Google-Smtp-Source: APiQypLmao/CsokYpSE9R9Ds27/63blUyPR6vj5mUakkOgGK3e3cGZyJb1CP4maohGvu3dHi82i9QQ==
X-Received: by 2002:a9d:2186:: with SMTP id s6mr12977769otb.339.1587451451761;
        Mon, 20 Apr 2020 23:44:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:6e97:: with SMTP id a23ls3213223otr.2.gmail; Mon, 20 Apr
 2020 23:44:11 -0700 (PDT)
X-Received: by 2002:a9d:784b:: with SMTP id c11mr12962709otm.28.1587451451319;
        Mon, 20 Apr 2020 23:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587451451; cv=none;
        d=google.com; s=arc-20160816;
        b=B56vBuGg1q/V2WvyT8krqTc5YluDA2tBdf6Sl8DBCTHSVbJZPemio72jy/30LSgVzp
         60l/OlF4HSDBtTYnaYVUZndXVGaGsiHRmqHUWFUbMryah3cBjDnvCm5hWsFIB8qX7Fe1
         sgrNx//8S4m72KiV/PNUpmPtjLq6EFdJThG4qiis/63WEgttbV6ts9PkaBUWo16fUDtt
         majatySe1Xo9GBweiIX4dBOOSgQbEIi9UnVf8iFu/EX3GBoxnx8janKTvI/G2Uijwe7m
         IB4ZlLDQSGnsyXASWvPGzj4tOM+Y7dMQLGgDBprY6J77WF+dQ3CLS/bkqLv6hyPtUYB1
         nmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=Hqpw4hdRoZfMotFv33aaFv7hKPfyZmh1BSXNnu+QuQk=;
        b=FH3Om11NG7OI0uetHOZsixMBZRBAoB4RNO5lactRSAEZhsJxC1bJn3TpKLNB4LZZ58
         QHfSTmO/gPiEFj6zBoEdnc4qhKxWtnf50SZlB4oeCXAegw0XQ0omemQMHlfZerZ9lYnA
         BDNv9Dlp2pxx7ohbf11sM04odo7NjHpzNo2x9uWp9cbKN8rdIIZFTIFEQKUilT8bmTUG
         cRK8lUzOr4M0ncAdr1b0mGb9IBSgSuESMP/IyZlJppS6tEuSjSShUWIO+zx6Flsrp4g3
         mMC8Dv6pEug1FSFgzP7rBD/S3yWiF2puIvFUkIgdkRBvoRpB2SSQ1jbs6vF+U30TMwp9
         4IKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="Q/aYZf7H";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id s12si105449oth.1.2020.04.20.23.44.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 23:44:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Received: from github-lowworker-1dbcc59.ash1-iad.github.net (github-lowworker-1dbcc59.ash1-iad.github.net [10.56.105.54])
	by smtp.github.com (Postfix) with ESMTP id D57136A0844
	for <jailhouse-dev@googlegroups.com>; Mon, 20 Apr 2020 23:44:10 -0700 (PDT)
Date: Mon, 20 Apr 2020 23:44:10 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/72ca0d-80e81e@github.com>
Subject: [siemens/jailhouse] 80e81e: configs: arm64: Add inmate device trees
 for all th...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="Q/aYZf7H";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 80e81e7edcfa1648a7488ca2405ee9f1d2c1523f
      https://github.com/siemens/jailhouse/commit/80e81e7edcfa1648a7488ca2405ee9f1d2c1523f
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-21 (Tue, 21 Apr 2020)

  Changed paths:
    A configs/arm64/dts/inmate-imx8mm-evk.dts
    A configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
    A configs/arm64/dts/inmate-imx8mp-evk.dts
    A configs/arm64/dts/inmate-imx8mq-evk.dts

  Log Message:
  -----------
  configs: arm64: Add inmate device trees for all the i.MX8M family

These device trees are used to boot Linux kernel in the inmate cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/72ca0d-80e81e%40github.com.
