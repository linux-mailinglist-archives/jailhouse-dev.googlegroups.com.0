Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLMZ2D2AKGQEVUZDWGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7B11A6346
	for <lists+jailhouse-dev@lfdr.de>; Mon, 13 Apr 2020 08:54:37 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id s1sf1533445lfd.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 Apr 2020 23:54:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586760877; cv=pass;
        d=google.com; s=arc-20160816;
        b=HeGENAnBLmXD/N3E9/c6GLKHCRO0ujoGVz+VZ38JF8Z4AyKIfixZJ25vKlQvq3ExD/
         sC1LdDxKbSXAmlRj2cpcj/pS5ANz176IpZ8UsQrge4b8WD7P8quLpNCRHo4KaH/dxRxF
         xdXbPNMburSr3zEGowy3W3PX40fQjFH+8UEF/3ICSsmL4ZsvJM9pPMJE/RY/1HuDzW5N
         zzJYjCZfn9fW0oGyWNtJZ01f7j5VHrNFG/RPgZvlkVhYvKDE8Yzem2s71rUxPBGwMilp
         mhHIuL03B10i16/ktGLsKzRu6VOJ3VqZYR5fcLx7FsSqYNCzudMQIT+YOeRhgjdSBnqP
         JCuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=smxwP0Ed+sGsfLs+w6yjlT7sZiAvBU7N80SrFve0hdg=;
        b=W8BKD2c+gKQYqi+vqReKXIN0SjJM3I0ZlBUW3/9dgq2Y0wejZCb/aq3ikyXVZaWt7I
         U4Ou03W7mtYYUXBCIDozDFrXZyD1aeA414bE/g+QUOLpjn7h9zqqvi3V5lO6QivFjSQd
         29MuIHgmpCb4VartZP8Qu6PHuofXDZvvlYo0E6gw4ZUGyPFB/RdRfmiHTQ5oV/NAr2ML
         CDtq8NDXB1FRcLBQDfUM+jcpr6j+QTf5iSqyH7riFEGKhCqrKYzLre2DMgHUTozjpeGQ
         D8KRWWPpvdGdkS+tAFcgq3KbmoKwI18/8iCqR+1EMzrEAPrNfW6/AryattzJxZQxurnV
         ONbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=q5knALxM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=smxwP0Ed+sGsfLs+w6yjlT7sZiAvBU7N80SrFve0hdg=;
        b=YNU4+3EOBLtCR/IWY5080R8SQv3WrQ2mJDtjouxtSIpq2m1yrfr6BOEbhyWrfHyyOo
         vLBR+ei/+9+IXGpFdAW0Chkmbsi/vCSPePVyTucX9GRk+qDycVtPjkk2f+G+EwC5m9Cf
         6EB+Jk1zD1gDHg+6SaeLmr4BAN/iw2SdT+MANjPC6f/Yu57igtqSp+esdPjdYarKerx1
         mqJMQIibUV9jKoI8P+wXCXYTkN9MftbXgf6z7i3NrW+rCNL2VXJbjB3yXuN2UDJcnfhP
         MGil51IPOsL7MsNxKPfTkQqdNO3dXffk1LSWqbwQjJXxWuB5IFr0caOI59sVnqTu/S8j
         mWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=smxwP0Ed+sGsfLs+w6yjlT7sZiAvBU7N80SrFve0hdg=;
        b=DNRUfnGhBV+oaVUd+Czl/IR6x9AnjiR45BtByRxlo9nDAJgZxhC/oq1sP0RYK1r+JX
         8VU+plMQ3DubFR43e8p09N2j+vQYvc4HDIJPGehbB4c/UVdys8yJf6GSGQQDFbzY/Oi8
         YlaGFdzhQuijtb8g0qkcfyLWQZBgAmJpk5df20mJD+advIRDJyjrlDPNbfWtwOVxaKcP
         SsOVzEw9zLY8yt0B4NVaT3iTvvQevlERUQBkay3NgOpFyalqqvcHg/Zv/eNKWynlDRfe
         Bb5pJLDa43lONnROBbk6KxRp3IOUbCEytPeoLR5G8aotqWDcg2vuNB+jBfhGA2IXcj4X
         nXrQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYTxQoFpT3rXWjzVUtyngWwct4MjUIhqXCK8rEOx40M2jcUF/jQ
	4rGE4CbbdzoECTDBOs5c2BQ=
X-Google-Smtp-Source: APiQypKib88bsGX85QhQoOVLm7waP8SRCRGcjGlP6dpGPft+pnxZUmY2fF0Wqmn/tergp6dBGbA5MQ==
X-Received: by 2002:a2e:9cc4:: with SMTP id g4mr9358418ljj.198.1586760877480;
        Sun, 12 Apr 2020 23:54:37 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:550:: with SMTP id q16ls3918811ljp.1.gmail; Sun, 12
 Apr 2020 23:54:36 -0700 (PDT)
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr468391ljj.112.1586760876869;
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586760876; cv=none;
        d=google.com; s=arc-20160816;
        b=ApNZ2jB5KvMOGmgPS34+YMm3Yem9b9W0V8BU5nrBFIFZ0crekI1kiDJquqHPnJ5hhI
         VrPdKuFVV1BwUoCl59MIUJE0JZg9EEqykDzLeMY8+ZGr/qPgdjhuNxuK9mobAisNI2Kw
         ZTt7bDiNDkMvptoETrHXY51Rj+4OpO1oI6p6KCY4S1X/T/WABl1FnnWAN4smNBK0cahd
         p27M29QKjQ14iD4Rp5lmN5kaXmKFLKiJKuD890boEkocPOXGYD56VMui9YTA1U22TLrz
         Pnlt4KiI0SZwGuPjFj0HepNW8Iv6H032gTZvxUvm93aHvX7TG8fgVb87WWnMeNqN78V8
         fQ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=PcEx/9TDHxrhDMXBVyAq2NM/t7vgsQSUFFplawR0mPw=;
        b=OeaHXARzpG2KOcQJpemeCFb8S+mb3vTNlgMjZyuk8uNDiRK+mAFMu8EMKz9E3mhqFb
         9G2OHVuYthjTgKO5+ti3+P8WU7QVdeTF3/McX2PDaP/QSEDaYTW9Kgj7IZJT6BPvU6At
         gXPg+Ul8yq9gBRZP8Q+PIo2r/HwrIQQURDumSDYK1QlCDTwNNIOlPseUtXK7vsiRIOBx
         1PlrdwAJJfaF5/9EWqi/a/IFTk4sVjPtzJWxSM99wIDrMw3pidp9IZKP3NwyQPwe+3xe
         BG28kLoA7HuVZcrwC5lwl87fCACk0OU8E2i/MZ0zOUbIkXPo7CxZFdCZSbRVocE8Iw4K
         /+0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=q5knALxM;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id w15si467712ljm.5.2020.04.12.23.54.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Apr 2020 23:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([109.41.193.243]) by smtp.web.de
 (mrweb103 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0M8zOD-1jY5BZ03LB-00CRbT for <jailhouse-dev@googlegroups.com>; Mon, 13 Apr
 2020 08:54:36 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 13/13] Update Isar revision
Date: Mon, 13 Apr 2020 08:53:55 +0200
Message-Id: <c91a7650c4aba5129735f818ec409d2bed92746a.1586760835.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
In-Reply-To: <cover.1586760835.git.jan.kiszka@web.de>
References: <cover.1586760835.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:Jw2OgwRuC8o8YzSlgV2RzabcLYRmSFJkK0aaAcBD248t/jf2UBN
 6O72TBzGds6ik9D5gtCE3D3A3yXcz8vgQiNgnnGOJCefUVs98YH9w0VhEle7iRgJVCh8wCb
 lvFJnlfPOZEj2W3chuX6i4/bpr0GiF19pi33nK/VDkdJJf9T1eEI3ndzjE4WuBGiRpThlFr
 Cocet3unb3aepsu9XxCoQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MN9z6iPs528=:M8xpGCEv67FDTvtaeFrtWx
 /tn6x3tqqXDhi7v4/rjVbV7drw7xe+IRYiN/v2cEuxd98zvrS5LO1GPMbnXpWhZcm7ioS2Ptc
 26DulrCWHCe15N/aYkvSAlGGxcjj1SRd+YEYB1fsNMxGK2b7BBsi7HGqP++hetiwRI9ra81vg
 kc9MOmmBNUoH5QGYi95Sha0EM/mTIs9DcVTldElbpNxmix24DJHeTHQf68r6EoWMMa1GrgmxU
 rV7BI0cwb8Up9OpZP2tGP7Iqxtv/3JeAhqUnpz65+1zpuQe6+0hkRsqaIYrMVUlWgqEkJ6nb1
 SUFlBK1uK7PbzfELpHypysXZ8wXk6Brcj/AH3GaXBjSRFPIdbEz+0b4QGTv46jp40E9vR9DTS
 3PUDkk26MlEVifokUIjTNSzGPDECJnxzTCtIFokvlnqOBk9HVwc0H/jqHTw1j6vO6KWkwtMBj
 RmysFZgHC5etT7tlfWi2Cqk5AMyeftxLlz9276sEza8pyJqzgkCoim1v1e1/JFpLngmIm6eEs
 MCvioJibdML/2KoNLODZTuQ5uFkQ8t+EkPrgAbyw6PBL7AO8um76N/FOxBkQJiGLEzm+MM12G
 PpirRZ9IvBLFGLVFheuykZy2RqTP5ePxTcR6gvCmvLMQAnlt51dlnZABfthTTC+qKDRLRvhyR
 v3HhXd6F1zi0ZH16t2ruMUgyl9lvW+rYFTe772HIWu7Jtypy9O5xh1S3f/70Pir+Ys5fLISbo
 S9L48naT7dklD3ztWcnrK6DRb2pI2Mn6a2KyUnZBfcbqE+WAG9MvItCT8/fPBX6VulhuWvwR8
 tG3byqdbipZHSxGgOGYVRNzB7JBbUJ/FWWlAeS353HppyeOK8ldeYhO1noIvXwEdbhsyWS+/T
 M65BfR9mARLpsTSP64G7Jgrheb1lpPqFCFktAZsKf4omQhfvbQI3XMGgBjBRXG2MTf7DjBwIW
 HSH6X/CkdEK/mDDQMM7dMEOrnihNZnmfHG2QdicYJlV6lgzYTKjYmdS6usTMUdHbQQE0IapDU
 5eYlnXasxCGXwqhYWv2GDJnSGM/jJ+3gFLTH/2Uf4GLcZm/2+uT6TRMOVxgZttETtceeQ9jSv
 n1iHqmXkafFAb/6WUz83UlYEXI05/F/GYiur9MNwzefANRoXeYAGnsFEahgKNWYKM71Ir6Dja
 7Xld1ngfs9vjrUZKSMSPsHxOoVZTuEInBofBQPlRht+oJeeRu8g7YQEH3BjxMb8H94thMqWt6
 hkV8sRjV+nd+REyGz
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=q5knALxM;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

No major changes for us, primarily the new repo caching.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 kas.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas.yml b/kas.yml
index a5a157b..8cff59a 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:

   isar:
     url: https://github.com/ilbers/isar
-    refspec: 619d6d88ac8c745282fd16773d50a466567615b6
+    refspec: 1cfe166c5e53ae96bc07b895a92bf6cd7ace7bc9
     layers:
       meta:

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c91a7650c4aba5129735f818ec409d2bed92746a.1586760835.git.jan.kiszka%40web.de.
