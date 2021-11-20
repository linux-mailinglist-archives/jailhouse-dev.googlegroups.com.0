Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBXXN4SGAMGQEOT2UT4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id B1283457FED
	for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 18:56:46 +0100 (CET)
Received: by mail-wm1-x340.google.com with SMTP id p12-20020a05600c1d8c00b0033a22e48203sf2190422wms.6
        for <lists+jailhouse-dev@lfdr.de>; Sat, 20 Nov 2021 09:56:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1637431006; cv=pass;
        d=google.com; s=arc-20160816;
        b=U0/+uoMns/hfD5jPxb0JzuJIFONHFTLfZalvxOUf4FFG6AK2nf2gkMJRsNITvQVpyS
         HzR4K5+KMur/AIm/41rNsOX3pErhjpUWj/1MRFFtuR6r52PwnZI9SGQRHwQJcNlFOWO0
         EPHakjdb/gYZ31KKNoe9Q6VG8fJqiduClz1hbNDKbTaFbrujp49BxjYRKPypT3nhz9kS
         yRQmU7+TY5pC7sQo+HJUfvJcl0K39y85TT9+76GuufxmGs1PNwx/zvnmkVXdQ+ghomog
         jO4QWFDKurRBo5eL1TfQNjmN/Rck03XUROyGm9hLIZyXo70tS+p1p0wC2vkHrjLdEyZS
         pPfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wJjhoPKGLBUM12k0oE1gpWczY4Mex3k9uIH97rRnbRk=;
        b=XuNWEIN63U+NWwlTQ8Hzoe5Nu31bf2NVbdpmMV+6NccMcpZ9EnovTYVWoPR17rSoWT
         BUyurTtDaxrq5zym3SiXwug8Hk7J9Fgr5yAJUgl4XBdM7cGuwtt6vpffdjAGBxDyWk/q
         24xj8rTbkhqZQOecP9dh7bVZPyw2koHHexHe6RfUeC3fnQL468nEn1+Hf+bXdLkgnYTi
         ww6KJN7KpAuBOQl+/ujQixIhjeFql/68jlwPX94dohZM/JcUVczgqg4hAjGev/9Edj+v
         b7PI/bAymJOvca/xzqAgb6ud6vhYa0D+qKTzkiEZBr29njx0RsTSbtfYX3UAwk34FrC8
         ZusA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=C330AIdT;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wJjhoPKGLBUM12k0oE1gpWczY4Mex3k9uIH97rRnbRk=;
        b=R7z5RBjAWD7d3aiB2knrdZ1MFUrJJLTH10IZeUMEv1y+hvDMeE7XJVOXJSf+exh7ar
         n7YY5mRDJjGKB8P653+1AW9/cM6PJDsybI/VTbp/S3ershLRKDTzdYM+JAgC39eRIV7F
         9Ghow1xJTfZS8KSdj4TZk1YzkyxbVEPdTKqPeubCTDnWmYUhte0N0+T0G4NDqSUHFLcC
         q81hGiQznaER4eCcvAHWcY7aIuYkn0tyHxSe8m2N4UlmFy8wLNkDQUk+jxc56Nec+bVR
         W7l2CUCARNlFNmDdwJX8tdHVS55Ycj+VQyF+++rn2UXMDtfASuBZ0DWhQNWHmX/rRbhu
         hflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wJjhoPKGLBUM12k0oE1gpWczY4Mex3k9uIH97rRnbRk=;
        b=BEzU64J1++s3ivJFQ6S0e5flQxUVeQ1o7FdQOI0Ip5thHwPayVdJjJMKqffHABoaC8
         Pe8gCEDy2kn0r0csVQWfFUxF5LU+kWMOp9FA2B267ajzJdlmdBCc2FXNB6zB/w5TZbxj
         lp2Vyobxj6RGyCYkc+jorM1K3jyK+pAJ0S0F8HFDgmmIEYZM2MSjU+m4SkHxlo9kPC5d
         lRtKHfqx1eCHvvmbAR1FEh7A1kUIxFCYxRIfBaM06zKVkwLa0daVtlhCc2TZX77XmKc7
         t522foM+4WoDmbEA3A+BNxsWqkjqf6AA3jeDaOnpIc/uos/oojgFCjafoMQBq2tmBX7r
         rsQw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533v+WvbnWiY3NfnoOLIIXWOutBmdGiHdUJhnKUcvXv7n5eaofhw
	AWT8wteQPEROQWRWrtcXrz8=
X-Google-Smtp-Source: ABdhPJz0Mk6L9IsUM9BLPZzlKZrhEnDCkgLxO7jkaPFdZ+NDUIhHyNvc5zvggZ3dRoSLvwUevQhbWg==
X-Received: by 2002:a05:600c:35d4:: with SMTP id r20mr12294314wmq.76.1637431006354;
        Sat, 20 Nov 2021 09:56:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f1c2:: with SMTP id z2ls3442071wro.2.gmail; Sat, 20 Nov
 2021 09:56:45 -0800 (PST)
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr20120494wrn.294.1637431005624;
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637431005; cv=none;
        d=google.com; s=arc-20160816;
        b=GtLEKhim7cpAQV5rXZ70al5NMlg5bgwkRn/vP5Nqgpfk7jYcDZgPGoy4QRQUpCPLWm
         xdxr5q/LT3EqRQF7BBiSoYr+7gjKc3aXvC38a3f+HxLG/xm+evNWodhx3ai5I9bWbe89
         xanPgdlBPaiP9SOadgJfO/rGlI2K3YBhyNwJ3LzyPRdX2K4vTFHXucgCnA0/g14xtXV1
         f21BuzcfCh2Ti7UnCzmSKL3aOQAFkFLHWEz1S6lSjxAKDl97l2fV9UK9VlfwhKxB6lw2
         Yvfc9vUy/EToqFEgu7XpE70TTm2elOwQjYJFW57WVlWbwWANRFG7W3SXLXp5bzaxO2qM
         4aBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=Oe1ghIEJI5wgMF7Ds4yHigz8iz6vLz9eU83w5EqloKE=;
        b=RJoMOmdAjWxkoojD9SJDsBgUfQf3YGooYb+pm8gSmOE5nxL37FJaVMFrBNn7jYH/xQ
         ESw+70GRRPNNX4CPixHmXPX4cjFPHlfvnN1GFdOwiYSRqI7c5MsdeI1DulUfHLdyoIk+
         1VFlU1G5TxqlSh/qcH4x4Ti53ut9foQLC4r+p9gW1+3uhW0StJEmEp4cnh+bkEGV5jaq
         Q/tBew3PDfsK5xcPOP6ly9UzG13kwT9AXawzaMxyUD3vrHvWXmJg93scZ8SSHdCii6LK
         EiCXR/MqjW26CYd9y2oQUPKKJNcAKt4YFjKJyBlgfFr99DtZYS7NYHOMMRV7yjtSEUn9
         t/Uw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=C330AIdT;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id z64si514662wmc.0.2021.11.20.09.56.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Nov 2021 09:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.84.132]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1N14pS-1meDl10mwU-012R78 for <jailhouse-dev@googlegroups.com>; Sat, 20 Nov
 2021 18:56:45 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 2/4] Update Isar, enabling ccache
Date: Sat, 20 Nov 2021 18:56:32 +0100
Message-Id: <ff97f7ecd7a5bba0a5ac2ff7a085ca3ef7cd51e7.1637430993.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1637430993.git.jan.kiszka@web.de>
References: <cover.1637430993.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:hmixAna5uSBXyXQ4UVgSUJROyxZkOlt4GJkq+BPZWK8xm5zotbr
 Q1gvdUBWa9vEwFpVaRiMkI232H0pan8PQZwVrTYUjNAXLN+OAREFs7YUS42BtkPZRA4eC3F
 AezLnUKTNLUqIN+5ZqHgtPbHJLPS3HG8xdwfFww23NKJsq2Rhzsbqmq9mqxZ+nA/mQdBylp
 eVtLehqBkSCuOdfBvHLoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d9eoh3+JHmY=:HDwJK+aC7rqFToEcarr9M1
 nHATc+eODN/yapRdNCZPz0yY3/k6Ny0GXNoiEviU/K5WApGRbf7scUPnOWOcRjxbnNjt8Z+CC
 kvv0aXQy7Oxtwxgxp5HWabAliyG6bnJOlW2sRd4uCbs/1BQ39cEFFR0yOxfIY3Mjtm2UklQki
 i0p2e9zbCbTvHnarjHIqvYUCBGUwdkeUdftAr6WbWtORq37vHcX/m1gmfLe70kGIbCBFDb+r1
 gKujQehkRM8bF4uMSTEJBjMZGxRjnax+AA1hZI9NsawyxSsIDoosmFYULLg5erEL9r8Wzrx9c
 eXWaRMjcKRFiv4lzpmvIiR3s7VL6ARWprPWl9Rk6A4tNX+kymG7MAwcUlxCwSKa6/xl8DbOkL
 OULhKwWqkqAs0tjCzx0r40S/EEnh3m3rVbDEl9FFpT+Zmqqmd+tz5fOOOEoIxBX7++sZyStnE
 +kHnotxhXjf13NMFG+ZvRrLNYF799omLjq66TSwhDov+KaqSd7huquerHai4YuqKJThc3C0DL
 Ch4mQQ/BamtOVTQZiJs/ujNAHgeOTQJJXKcdMz3WCTmTslW9M81cWzc7CW/ajTKtksEgBT72U
 d78myOBSntVqTl9OYTe3wPFK6bOUZyMSICxpcn2wGZ0UrPlfGPYQA0i04Dr6VB/zgB/NFqkwC
 F1qtahZR6tV5XzV4GiDvX/lRGY1+4zvOMlYl+UR83JbCusoibraewWVgEhZn1Uf1akDZEAf87
 293wmS+Gbqi4dcB6nZPZD5g1MJ6K+1O5LgXY4zkcuGsj1JiQXt1+uqVoNAuqwWfAZxhL9uwmt
 CcDhLiSlWXnmQsIetxdoinvqZJNvq2SB2oC1M2RNiOaVVOVDWPfTi53Q7AQuSjFcBfYdBjoCk
 mVj6vrluuydnQzRcf4DVsuMiXmo21Y6GM7qC5GKw+yDI8bTNjipAOjjiD+c6bIC5HaKl/+Dir
 w1DKAyokcOYm32zjbDyTIomX/vmnQhoEcYVs/y6HMQ8TyuhRSsqgmGdQ540KzCCB5OU0h5Bd9
 5ktzZ5bOb+3XQ3i1BS8q6ahaFGyaG4qwhJ5VwU4LnpskYNTFJv6pLu1zxgL8mThWtWycgzgfx
 5IXuaPchJCBc0Q=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=C330AIdT;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Bump Isar revision to later 'next' which allows to enable ccache, a
significant acceleration when doing rebuilds.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 kas.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kas.yml b/kas.yml
index 697205e..0ffd888 100644
--- a/kas.yml
+++ b/kas.yml
@@ -23,7 +23,7 @@ repos:

   isar:
     url: https://github.com/ilbers/isar
-    refspec: dbb9df67c1321aa7f6020948a964a2bcf636684a
+    refspec: 5f87d48f279761c2fefef1db16b4ccb5b955a364
     layers:
       meta:

@@ -38,3 +38,5 @@ local_conf_header:
     CONF_VERSION = "1"
   cross: |
     ISAR_CROSS_COMPILE = "1"
+  ccache: |
+    USE_CCACHE = "1"
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ff97f7ecd7a5bba0a5ac2ff7a085ca3ef7cd51e7.1637430993.git.jan.kiszka%40web.de.
