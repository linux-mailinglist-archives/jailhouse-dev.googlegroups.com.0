Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBL6G5H6AKGQEKYYAYGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id 9525829E396
	for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Oct 2020 07:37:36 +0100 (CET)
Received: by mail-io1-xd40.google.com with SMTP id q126sf1232843iof.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 23:37:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603953455; cv=pass;
        d=google.com; s=arc-20160816;
        b=PCmdJtfeBWHA7pusN3x1OGg5kAbU6EqUyJPtD27F/qInlFjXhLrd6EuhT3CBOB6Fmu
         KO7/G8wJPPMrznmvUivdRDFBLbLN+1ikE+zrq0A7VNPuPDpZ1tn4RmJr6VjozgQaSOxp
         hWI4iVidb/wDo3kvNiKgmvf1FnjanKHLAKILL9EwmUrhL70L8t+AerzhEpTCgCXMfCXt
         KvJLt8JvOaHGBRJpQlF9lAvo+HMpzcXlFF2gaaCm/vzaExcksAOi41V71SsPCGEQrSQf
         rO9PLyf6Y65Z+gjxPzv83Qdmhw7oodflDnMDUlzAL4PhrbGY3gXcIRPZLbWmhf5gF/rQ
         Laig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=PtZqOY/oTi045QcIKFdz4vstnXOj70c8mGTQ1oYkVPQ=;
        b=HDw3r1gXIMKgPjIIdWXtt6cpll518xcXw4Mc2leK4h97H4jADoYatYEGggVbvZeb4Q
         v/4C/HB+TID9E1Lb7pZQ2AfVqW7XF0eIeGyVEX1A5HPQIcn6j6ryu/YMbsrgYl9bHUoh
         QnYtdvdtSa0SAOOEUk8obJPUUve8TnEsaR9X1c/c+r7BTHKxONGp8q1tafnDDlp50lJK
         wDacD4E1BGuP8o43lWDme/6Wqx84d7t08bRbQ0FSeNiQe884+F9Ky91OoKDtEV8g2aZv
         nlW7j4LEjiweQqVNuPeoH2Uu9Hjx1L4sPf+Iis45tx24Fgi2p/vThKoJARaPdrCa+faL
         M23Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YMmETwFZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=PtZqOY/oTi045QcIKFdz4vstnXOj70c8mGTQ1oYkVPQ=;
        b=ok8dD40qJGCcLFCTk9Rv8rbyUU5JIugWoAzLHetsyAbwy4o0zXLDW1XZLW3BS9rBn7
         S+zglzK8gE0pOEcY5NTr9wBvXbSRnY8MwOM79s6tckQ9D7Fx3Dsbmm0ik2CzcQlB9kFp
         5/fPShEiInxiaY4J/ysUA2Wses9bHVBY3xJ+nrw7FG+CRkP60G/8p88SXWY+9T+8JEMO
         dsgPgTdootV+T14SHl0NDraB6lVeJU+mqVoLEWwgIU+VEHTrGiMplru/qzo/jSCwqAAy
         PAQE+fVTepOvDUeC2/5StdtmmnNIOSg9/bQzQ86eVB4KXFgJ0v8WGxrBa4DB0hzRNOjf
         0HZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PtZqOY/oTi045QcIKFdz4vstnXOj70c8mGTQ1oYkVPQ=;
        b=fHUrZDagi+PX+rvOcLH23IaXRUGauYHMRepnSEI4ybCCvwNPyWweiZmeP22+71DEgG
         pyp5SCbyQsmfH0g9h4RAboVOEKaSsAOGw8IDM+fTJX8RGKnmqeTeuSMvxUNOWrUmaiI7
         o192pWu3WlBiYbtyWx+nysoowoQzDZtHd5vismsiSgTakQU+CPQbgOtGorOcMW9p+JAb
         sYQC7r/oTyvYbqRZhfTx7jTdF+8S7YIxJVlvBsaeU5kumDwGvBw3wxlO3BspxkB7x+sX
         kBV6iYhCgZ4KQZGvHCDuzwYeR3OpmXDlq3vWgv/hLFEq+qfvceKHl70/bPPj8pvxnKFO
         k8IQ==
X-Gm-Message-State: AOAM5307LK3+5BQbj11DnlPjxskBrfEwuywtWBeealZilTqLu4m6J1af
	LXtRxdUnLT445au8ViQINqs=
X-Google-Smtp-Source: ABdhPJyTQIEMk9yrmwvtHBfiJ6OTxqPLPUh0lJlQbjTS8cQN9QAEOG8yspQeHIsCptIuBeRS9njpfQ==
X-Received: by 2002:a6b:8d95:: with SMTP id p143mr2421503iod.60.1603953455431;
        Wed, 28 Oct 2020 23:37:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:9a07:: with SMTP id t7ls461705ili.8.gmail; Wed, 28 Oct
 2020 23:37:35 -0700 (PDT)
X-Received: by 2002:a92:d8cb:: with SMTP id l11mr2185283ilo.88.1603953454947;
        Wed, 28 Oct 2020 23:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603953454; cv=none;
        d=google.com; s=arc-20160816;
        b=kN/+ZZYIK4waepRvGmtHSHEjEmfVUikHiA2o1hzTI9sRLSJF0rpDH6ohd7/wJHkzep
         RlkiQHqZI/iDZ755XwuYb97dON4z0+ityTZ6uToGKOp7+Nsf3LkSqLQnFox3HGJezVaj
         46ud5jZE9hA0p+kcbPUOWbzOm4pwfkGPwOSsCYJkArmF97tXNW3rey8vce/6IJ1wsA2v
         0EuICTZ/PuN1TXTPSrvQQ0U9xpPQljWOJdrHLgqfzmkIZx480hXAc0vCgibmH+nyPu9R
         HZvHC4RE17Wn1A82Ylw2gzkeD5YSQeTwcd5xW2Rd10YDAL1ZkxkIzxmpKGydYhjZskqk
         6ACA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=SZKnfTQDJEa3+za3B7xgWrTuHMRa23oJkjbLlC1oAdQ=;
        b=h76txJ8KQUZV/tnIEMaH7f8iVM6ium8+nOFH1+xp/iWk7sUq72fyJwqwnxlEpX4XJQ
         ychEnEUinI8QgKxBztmy2X2fr3TqBitusD5EqdEO8ulLWOtQWvr8k5VxNrjBXwGCWDZ+
         r1TPR9+2Ne8t1/blofxi3jyYLRQtS+P8SCjHHt9w7DxmLqgTHbcW0QZaTFQbjurAFlUP
         Ub2QDvuTHTFj/vgpe7MKHIjVEcDnZdwcfr8EgOhpRC0EqPVdhbEz3W/0VamZ5jd6k1I5
         mPTS4sy/LIfPwZ8xK/9LFRFvxMiwdFNiujA+fFZp3wE4LifYSdMySLB7DBiBsLsJOhYk
         aK2w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=YMmETwFZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=github.com
Received: from out-26.smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id d25si112233ioz.2.2020.10.28.23.37.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 23:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-a87f560.ash1-iad.github.net [10.56.110.66])
	by smtp.github.com (Postfix) with ESMTPA id 765A95E01EA
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 23:37:34 -0700 (PDT)
Date: Wed, 28 Oct 2020 23:37:34 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/b95b6d-f4a941@github.com>
Subject: [siemens/jailhouse] f4a941: arm64: smmu: Detect busy units
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=YMmETwFZ;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
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
  Commit: f4a941d9e0247b1aef871a40b47c48d36645f2b4
      https://github.com/siemens/jailhouse/commit/f4a941d9e0247b1aef871a40b47c48d36645f2b4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-10-29 (Thu, 29 Oct 2020)

  Changed paths:
    M hypervisor/arch/arm64/smmu.c

  Log Message:
  -----------
  arm64: smmu: Detect busy units

This avoids taking over the SMMU when Linux is already using it due to a
configuration mistake.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/b95b6d-f4a941%40github.com.
