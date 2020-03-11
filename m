Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWVHUTZQKGQES4WUSMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id D85DF181E10
	for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 17:37:47 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id 206sf1814657qkd.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 11 Mar 2020 09:37:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583944666; cv=pass;
        d=google.com; s=arc-20160816;
        b=aRlRGZbsV+d881ftFFCcYjGTT8Mnvkx01UHrDd7l0/udn/LF3UYZZiCraOZQSXSD1C
         AdKRnHxL3rWpF639/ASqrncu7+U/4YkUZosPLvagKOiv9g7WY3QM6FqKL/NF/ju9ZukH
         2TNoC8+1W5kr0gN9Zksx+pOMHA321R4RiuQCIrjxAZVG9AQG1vdR359IHcE1fEOuXlwn
         IfXVR/AlzB4r1gKIswv4GFO7KmT5EVd2skjIRLAMPDzYDlXghTGdk/5TKX4nCr9qZjNc
         4k7IaGplyFOblX6NQC0bbuOrGnId5sfICCOdbtowTznoGoJqzBdJjF1j0SoiBiaB06uT
         iXeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Ex8U8mvULvV4JHjeRX8VTdLAjv/yLppvO/knTwycrGA=;
        b=tIvze77eawBYoijaz/erI++8rZRvHUpnCdENR+Kt2nzg92LJqKTC/f8oC3neG9imjI
         7CNbuR6mwF1vDcR2QZB3Chbt8CHkzGVYbkjnUV28RHVykLWGYMkwapaZDPOfjc1DGW4B
         1mRmS/cPNEcwQJ2+Eexfk971DSgJyIJyV7qtJgdAPru0/DOLUAIVCCrP7pLzGhOH64rv
         KPtoPYPvNd53BEH6ZdbaGvxK8Cd14/YxQvPawtLPIqm2tZjfm+BSVTVKCzvn4zCUc7BX
         Cw+wu2RimS/7qsw2VvZxQ6U6iFHSmUcPLuU4K1jk2wkbNPwe7oCw+VOOcnKMY8ZF0FKM
         zxDA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=C0WgTATo;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Ex8U8mvULvV4JHjeRX8VTdLAjv/yLppvO/knTwycrGA=;
        b=Q1GEuZ1rFyNutl9Rktz4enkqe0f0lPDyQ6suG63pqmfgdmISfXICqBkarOx4J7csNd
         ioyiZi+EpRyDaILMWw5LQCwYNl2MxZQk1IB3Qf7sAVhpQ5wm2Xnl5dK33VrhfqCJP0tD
         sE8HLjjy+cIPdCms8pFXKEz+UO5foFz+JjnSG77Z5bzJawERPIwJMAgAlIlOnCvfwggT
         /mk8o2ccOnwMpkTXKamPQFU38KvFvB8/AX/PUSlLhySqueB1P5adFMvv18L0SmXFIz+A
         qMY3EVRxK8zltT6PAgJq2boWxb68kAljfXltRlcE5731Iyxhvbsi56v7oCgoUeIo6YxO
         uZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ex8U8mvULvV4JHjeRX8VTdLAjv/yLppvO/knTwycrGA=;
        b=aSsBALXOAFU3TPBol3VVZjL6gaHuHaViw2N/taqNeqH2m4bAxG35h4X6ekOjb5sNX1
         4aLeePIBfnMMMoCQ6RCFtz3r8dUzWWwLUUeN3vpW9ie9rwpvsoCSWkTDV4l4wD8LlDzj
         vG0P0IFhImG1gK+PJCfZ9HtWFQrj+1eUApYK6milz4VG+aYPHZ8ICcZNchnbKP1otH8d
         GG8h8ztpu1k3qWvFw1qt5p6cYHxBSIWlbVOx7EC56I6sQj98MQq8Djoz4LvEQzBorGog
         IXn7lzPqBXfFQ13ZUhCZdpekf27MeMO+xerB1RqpSh2gj6/WyshjdV7xOHvl7fS3DxE7
         AjJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2tJFfM6cuu2dRHPCd9oyDPB1/EhAPwAwlUN+28QVyLaVuZ0EHL
	Y+PejqufMtXqd96dIIryWwM=
X-Google-Smtp-Source: ADFU+vtO8349+Av3YxWVdw+EODqzDj4Wj1CUsWBNsbgQeHLsaIf01twATb96Wln1MUHm2/z8kY9Z8g==
X-Received: by 2002:ac8:6c4e:: with SMTP id z14mr3481204qtu.138.1583944666528;
        Wed, 11 Mar 2020 09:37:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:16c3:: with SMTP id a3ls877967qkn.8.gmail; Wed, 11
 Mar 2020 09:37:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2f1:: with SMTP id a17mr3699360qko.438.1583944665796;
        Wed, 11 Mar 2020 09:37:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583944665; cv=none;
        d=google.com; s=arc-20160816;
        b=Jbjf9+3q53Ja/l0rM+qUOpXldtvDoV1+KJDxjWvWLnrVdfh0HpxiQvYbgupSkQGXO+
         /gN0hW+5taiqmJ/I432Ek1uP5cqSGfsDKsdIyn/hBGBKcV4iqi5MMLmA5li4pHBD5C3D
         DLIySm1Uh4rKZlL6BhF9rEHt6DlTA7or/QiEZeNtAWzUr+ClFoD/qBfgeqJeZOCsvrfX
         tmT653LCWogtT8GUOfGNJQqA7OHSo6oi+g0AhHJGdFp3ZAubiIBNgCcKmp+RWJfHRvml
         2aN8YPYO83AmYz9g2AqFwLSbYV+rc0J1Pl0yExFCMTj48pmBwSkuZyTOZF6i7Xm3GKu9
         zhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=wEFDgWijg1bUxFxKh0Ad40E2g52PTWqkCbctN6yQVws=;
        b=EOrOf3dI+SPG54jfvVWsO1vqFzoIuLNTtH3DOWdAbJdeik3lxNVOMT0bWSJ0qUaKIM
         pvGcainXF35mNcGEjFioP7Y4IkaTUnTsUwmbHwu3C82JsroonFV+DtDqYQnPPPuCNevV
         U8EvsMa4J7D0GGJrREQYmOw7x75UuF4+sxLAGObXeLs4+jAuz4ZKiUN2e8xS6wkYRvkR
         2s9OYzHtu2q0DWA3zgOKIJwc0d9sBFBoaA8Cqla3z/TtSAip2+LvmiAGvkNsdk5lw1Qb
         ptjPz6o6B2/dxT1D4tY48jgx419Lf8/nSMtK0E4kR+E86M70WmDSOL+M4N7UPGhLws34
         ybpg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=C0WgTATo;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id w53si112835qtb.4.2020.03.11.09.37.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Mar 2020 09:37:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Date: Wed, 11 Mar 2020 09:37:45 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/percpu-mappings/53786d-000000@github.com>
Subject: [siemens/jailhouse]
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=C0WgTATo;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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

  Branch: refs/heads/wip/percpu-mappings
  Home:   https://github.com/siemens/jailhouse

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/percpu-mappings/53786d-000000%40github.com.
