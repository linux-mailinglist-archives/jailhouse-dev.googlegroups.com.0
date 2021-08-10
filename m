Return-Path: <jailhouse-dev+bncBCY5NL7ISQIRBDP2ZGEAMGQEMGW4ZAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BB3E5AF6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Aug 2021 15:20:14 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id 203-20020a250bd40000b02905933fff7091sf13415766ybl.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Aug 2021 06:20:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1628601613; cv=pass;
        d=google.com; s=arc-20160816;
        b=es8iM8Ac1Y74D576g+4DIHAjriqTUlv2g0Rl/0MaaggkQoNdA88TmdYcXzmps41hPG
         nB2Taky4bERnlpkXTUdg8B9i91oqOkCqJJw4e8G7IbE4th5D22aRIyinOY5Ky78Cr1j7
         c0Cial2VVSO3lKwF49DrRyTmguq4pK5K6MmDNMR8L6BMs3ewIRPBbTpYz0tazNhN88In
         q5A/rn37BWsb+kW+0elGF0Bzvt7NAquBC9a5LkELosFRhG5u3TObvY/bOVGuIK4wxGNW
         55C43yc2scv+hbTDit7IP7rDCg0DxU8HtzpreoMTWYeLBGwZlR7DIZwSnGuK/Vfuag61
         UfCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :sender:mime-version:dkim-signature;
        bh=ujAjErYHBJAJKQbVstJ99Ih8mxKfZqqZoAJTZGzXNnI=;
        b=Nj9aiobMmCIs4gsLMo09O77rilMCi4SEZFNkIcxgIsNUqeXjslr7GzHItUoCBd3o1w
         pXIF/XZK6rFv7abEXh+AJfWqldasJz1fAioFnWFEBhsjNMIY01nZQC6415TMxqJxyjsi
         LH9VLb316jxehNamN2qQd25hWCbl5Y1HeJLMJeQkhvZm7UPOkpLItzilq2lHrtGYClny
         jPAyz7VfpcR185uqouFIUMYMQSTUQn6ezVgRep2vN8wugWovJnbakx/HB7TKyMI+xGX5
         U2O4CAIZEjcPTvIRZPEQVfGgonzHzZI0Jf7qg4DuOQSxN4z9CH3WYrZb8ZRqcyG6K6+1
         4M3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r56fIwbJ;
       spf=pass (google.com: domain of immeublesourou@gmail.com designates 2607:f8b0:4864:20::92f as permitted sender) smtp.mailfrom=immeublesourou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ujAjErYHBJAJKQbVstJ99Ih8mxKfZqqZoAJTZGzXNnI=;
        b=q3PxalRWtiJ2sCkT/DITsItNv4ARy15eMOKNYMKHEMfGYgwlfO9zhQzSqLHAqc20kZ
         EvkQVe0FaaKoD/3VyVDumFtz9S+PRGVW9F31Szs1cw5FoB0svEKel4iT060Fq4FGJ0Sm
         SzqVLhenggZK2Yoc0aPQtpUCT5fRiyHi9Eu9Q2Y/lKlHpBoKPgE9ikGhV6sP3dCjB0c9
         u6qnBxmHqBPqmF+X+X8IYtXr2kk4C/nBkAy9YwYEZQyYzEGJkRW6shX2WAT03fp1fEAm
         K3nGcVIdmp/pJ0ZJ+OhmgC2VCPvYzglLnFeHZQRmByCtvfcG1tyfmmi9LwO3pvHxyMBI
         0UpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ujAjErYHBJAJKQbVstJ99Ih8mxKfZqqZoAJTZGzXNnI=;
        b=KzTjRte/aWGNlqHOchytJ314H5bh1gV1uB7oDMU2QFykAdB2OV1r5piE+1DKBP3EM1
         mUVGQwpfcD7wPVQH1ChplAR9eQbXsnSrbkrUrVFNGGDuz9953z9cChO106zdI+Gbyt26
         aB6ONpKEVuLgykc6YJYBD2bjtw33RwFukJ79fK0yp0M4w2BBfdH4oYKgXqa4sfm+ieLK
         X3zsnHCyPYj5h1WLsXfGYiRH2ANK7FP6AmcE93W9nnAizz0cnQydmcdkaMQDIttJUZG+
         LMoVoO2ct7NdrV7jKq4u54fMyf7fHcOfw7DY1p0skC6HepMC8b+LWKGD1a0kwju9s1Nd
         o5yw==
X-Gm-Message-State: AOAM533BIRRniN13A530bENU9z6zAUC31RzTC3fmEVM3Vx/YydxBiM5C
	2N28hszjC3YMIzU4ePwtoW4=
X-Google-Smtp-Source: ABdhPJztI6BMhBsPc43cSgWvfqmRgi4rmwqXdPSZQiE4nfB59cZaVxhzwT5/Y+wPRod5st97QlhqVA==
X-Received: by 2002:a25:6e55:: with SMTP id j82mr38483101ybc.480.1628601613599;
        Tue, 10 Aug 2021 06:20:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b981:: with SMTP id r1ls453989ybg.8.gmail; Tue, 10 Aug
 2021 06:20:13 -0700 (PDT)
X-Received: by 2002:a25:ac85:: with SMTP id x5mr3932548ybi.337.1628601613040;
        Tue, 10 Aug 2021 06:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628601613; cv=none;
        d=google.com; s=arc-20160816;
        b=rAamgQzHiaUP0ksisHeRe+KrX8VaKIrSA+vOMhnpcKnyvGYIqJVUe5CoF5r4gSQPpS
         SzUWMInRnjvYQ5Qq5egKV+cvu7tSWebJBB/NqwyBqTUHirszKkEeVxs3pXokE3OyGtOX
         fowH3m+JKKRvejxiXG29QWLLVWRK5duiU98By/jRpTTb8xwnCQJ5QDag+5tC/bgXsj5d
         edgT3BN3IAdhuJqHCci+NIIhuOmfPkYHzddXOpHaF6mufdwkgqKVY7yQYdp7hhF1FeWX
         8eo2e7jD52+QTRodrtKAQ9ig6r1HBfKfs7IhSIVGV3KsxQNPv2svX6tHzW93ixgfpk93
         XpEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:sender:mime-version:dkim-signature;
        bh=2tvLhkad0w+Mh63WhnFJkmRFgYsLXsJmUqGVjzUAFIo=;
        b=OTOnVFC3BMk245YUqo67iH+vJkPF43yJugSYuOVyw2bLfiVDl6UwcdFX/+YLCCUhUK
         JDADi0tRluj/bcOGTlomlBLg/QyhHW9WO0aNcRlxBy+j4UMx75h71EASkNr4uvjZqCjC
         y6cfjK5P+hvjIBxDQhpPeYWu/kFCsNswFA35P5OwhSmW8Lz+298POms4QfrI7Ubxf/+c
         y5Uf2c509A9Qyz70ZJtCHuxmuowRqCA8TuoVFDWw2WqtY1EQT36/Q0DwhxkwYWZlpCb+
         xrKpBijg8u1ab76weVrTWIJZdVmCNWtd3HwPrnCD3jb67r21ZVl/OOxxER49rfy63aPF
         jf2Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=r56fIwbJ;
       spf=pass (google.com: domain of immeublesourou@gmail.com designates 2607:f8b0:4864:20::92f as permitted sender) smtp.mailfrom=immeublesourou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com. [2607:f8b0:4864:20::92f])
        by gmr-mx.google.com with ESMTPS id d10si1309480ybq.1.2021.08.10.06.20.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 06:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of immeublesourou@gmail.com designates 2607:f8b0:4864:20::92f as permitted sender) client-ip=2607:f8b0:4864:20::92f;
Received: by mail-ua1-x92f.google.com with SMTP id t25so8524246uar.13
        for <jailhouse-dev@googlegroups.com>; Tue, 10 Aug 2021 06:20:13 -0700 (PDT)
X-Received: by 2002:a9f:2c93:: with SMTP id w19mr9591949uaj.26.1628601612739;
 Tue, 10 Aug 2021 06:20:12 -0700 (PDT)
MIME-Version: 1.0
Sender: immeublesourou@gmail.com
Received: by 2002:ab0:3903:0:0:0:0:0 with HTTP; Tue, 10 Aug 2021 06:20:12
 -0700 (PDT)
From: John Kumor <owo219901@gmail.com>
Date: Wed, 11 Aug 2021 01:20:12 +1200
Message-ID: <CAHdg_cRt+TWqdUjK3Xf84mj5+AwgMtamTmu9J8c3d6u2KdArLQ@mail.gmail.com>
Subject: Urgent
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: owo219901@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=r56fIwbJ;       spf=pass
 (google.com: domain of immeublesourou@gmail.com designates
 2607:f8b0:4864:20::92f as permitted sender) smtp.mailfrom=immeublesourou@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

My dear,
Greetings! I trust that all is well with you and your family. Did you
receive my previous email?
Regards
John Kumor.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAHdg_cRt%2BTWqdUjK3Xf84mj5%2BAwgMtamTmu9J8c3d6u2KdArLQ%40mail.gmail.com.
