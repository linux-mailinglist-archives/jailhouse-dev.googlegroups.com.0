Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGPE3PWAKGQEM5SULNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB6ECB4E1
	for <lists+jailhouse-dev@lfdr.de>; Fri,  4 Oct 2019 09:17:46 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id b143sf5459339qkg.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 04 Oct 2019 00:17:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570173465; cv=pass;
        d=google.com; s=arc-20160816;
        b=qD17o7V7gtKHyhhxmaIyJe8jxxyJe8s8OKvBo6I8lmBCnC6a2cq761TGWRgab6gLSW
         UCKh3wKHHffNQWO1bFXHTiV0746a5sbdV23av8BOD1jJmPqlZK9Q6E2U2j1o4yalgSsN
         MIFIiMQtC4qe5socwcESb43u43oPcLnZnVIo22CA41rGZz6dUWdCcwV1bjMG679vaDkc
         smhjj1lxS0GOx7j6bet3O0ZBMhajBv8VMn7M2VJUvnkhXNZ2PP5PMccG0PbTPuOMGSd5
         5c61S3S41Cl+xh1wldyt5xn2YzPbGqd24oFwBHPnLUIowYCnHaI98CIV7jex4vttS0OR
         N/BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=OxHJFDwPEjK38zldOKrSgeS4fuS+VUpDSvjQvULmMng=;
        b=0IABm9HBOHnmFEbgopepDhGjp1drmpsVPLOf6zsaY0fuHPRkGN58/WYxo+rw7YPUAG
         qiJ2/bQFVZnyVxxYlvybp/ifFbutXUTlMtHXuMi8JdOOR1OYNOx2Zy4olTmCDVRo9Uaz
         715Io1C1Zm5s/MRnhteWMJ1EHx+/bmi9ghJOXvIqkUox7PnXWIjsuPayhM322owBQ2LB
         h30k9lt1rO4EGOirr2PxLuwVNiUFMtVr3OetZMaE4iq6XiRlVZ/I3fBCholT18o2XEs7
         +UUKgh0piIMbtnZBg6LHBOCU4bg9ZsdWn09BwKgGdTHxp5KsW0B/R4w7hjdcjDbD+F5d
         9M5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=c6jK1A49;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OxHJFDwPEjK38zldOKrSgeS4fuS+VUpDSvjQvULmMng=;
        b=tJRgr1MurOc+AvA14+uLZSD7X0ZdaIDEuXhmO7O2u6aeT9isN6jko+r7kOckug4+3y
         +IzDPyWBbvMIC3WEipNKoJXeh2/qgxSS+6xPmjV1hrRyjIez3CrdeYoGepL8mJhKlKTD
         ptiFJ0+akHTnGI4w5FQ20QbYJPn6/abzQyb/vplEfa1HInyRt2rAt0F7OC6CjY+4HSw9
         SNlwCoAkuchRnyfY31uKT/KcDTbhmJLXNgrp8MGRhdKlGiF870Y23Fq/626fE9tGYKhA
         hCs+aiDzQkL613NoxFkUsPutB/lSgvnbhF9sAwTgK1QLf7+cG1Xzd9GSUe1pj7Yot8Dc
         lxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OxHJFDwPEjK38zldOKrSgeS4fuS+VUpDSvjQvULmMng=;
        b=S0nmeP9ttg1zRo6sKJ4wjAHuSXqzyxIRhnCLVYypiRW5jHpbHFXkVw+RGBMJVuM8f2
         KLmylctS165rH7rkLyKPCzD8TlFFPLEigKuR8YhK4PasroBRZnRTDvkusnXdOg3HgLOq
         F49OiwFX1PAc8joEfkzZJIzR5TBUStqPgT5xrfTuXp+aJs0tcQMgZrJqnoiL9nsNI87g
         y0uNrFXwr9Xf9TgDRUP1f7aj027IcJi2R7oeNigK0kTTgNBcAWycR4Qa3V+QOIGovm3m
         zJm+m32yDnWH9lyZ4ibL28dA6+0x1G1zb1m3OJB2rtoo1DNCBOuNe64L0GMOE0n+lb+S
         zRjw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX0Mzl3e8mpQAFW4ZT3PB0PQEHRGILqoLjtslkqNEd9r+tt6it8
	sYxMBfGQTIRbL8gvS7lCZjA=
X-Google-Smtp-Source: APXvYqxuSXBs8RaehaDSruIjtyCI7ga4QS3FMEqMTZdHBFQ+/ZLAVnibMP22myKsXZTHLHPP5vrS/w==
X-Received: by 2002:a0c:a5a5:: with SMTP id z34mr12664045qvz.110.1570173465665;
        Fri, 04 Oct 2019 00:17:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:e409:: with SMTP id y9ls1955168qkf.1.gmail; Fri, 04 Oct
 2019 00:17:45 -0700 (PDT)
X-Received: by 2002:a37:a946:: with SMTP id s67mr8898093qke.470.1570173465233;
        Fri, 04 Oct 2019 00:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570173465; cv=none;
        d=google.com; s=arc-20160816;
        b=olPhWYaqX7ui28Z4uifJJ52QviRt8gHU/tmlW7hN/EP9+iD41nH5pZQ2TtTokRma8E
         N8l8kYsMgo0CRiSGlz3ayWbv86XNRasjQ7Rua2Fz7Eonkx7/W+mtBPKIMx772nz+7+dt
         NcDXRTtU5pwAUCvXF/brswk8FR8c1/K+Zd6cFkkClnIZO5vWfDIBGnuWKXf14zp3/JUD
         oo00qHk/TGjqK86qkSFO40HDTTuO1Q6PqimMnD541lNgMRkVsfNEoc9Zvvkvw9z68aAL
         zN+c0wqKl5XpOl7/LHylL6nQrs8j4BiQCjBWQGFLlKCHTksVt2FjgxC3lVRfHN2lfRKA
         PPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=ksWDK1KjRPVa7vn6q4bMMeqf8Pw+5tYo63XZIntfUj4=;
        b=s/8sBjo+AHueeFqtT8fK8d2p8pYT1uDtO9y0Fuy7WVflTxLEC8O9KNje2Pi4iwcWvd
         aiaEL/+RA+lZqoOi8UCFBjftjXNAfgCYINeAMlhUGfNqM+a1k4OPNciR3XTos7NwPJUS
         A2eEvGDL2zCItYtc1YLBMaxS00OC9Ujim0Vv/6CGnFxA/r2BmD5d6lM+p3q9S+0jrV0J
         Ozp954Y/kk5aN+5LpbE/Ca6ZPKGTSMVkLDkStpyFLv3QKQuaRU8jMBPYWsA9jMI1OSfb
         msn+H8kytUjV/XJmkZ+F0yNtwYxcCfQIeisv4ZL4xeqpMq1vphuDsNFUpjbfTBg7sjN+
         oZ6A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=c6jK1A49;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-11.smtp.github.com (out-11.smtp.github.com. [192.30.254.194])
        by gmr-mx.google.com with ESMTPS id u44si430359qtb.5.2019.10.04.00.17.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 00:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.194 as permitted sender) client-ip=192.30.254.194;
Date: Fri, 04 Oct 2019 00:17:44 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/ed7c7c-d1ec5f@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=c6jK1A49;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.194 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/ed7c7c-d1ec5f%40github.com.
