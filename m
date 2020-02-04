Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBRUH4XYQKGQEFZ5O6OY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAAA15189C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 11:13:27 +0100 (CET)
Received: by mail-oi1-x240.google.com with SMTP id 10sf6075806oir.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 02:13:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580811206; cv=pass;
        d=google.com; s=arc-20160816;
        b=VxXPkpIf+UVVZ/XwVJeStFUnO3pg0xD6XXdL+nPGTK2ZmYof4jat1E5d0XF38q6wxl
         thBk7N6db3dysDVA7ngIDKR6FZyINlumTA+ataqWF0dDbSEAuFz3cHIB5ANgC6usS86y
         03Q6BfLcdyeVw4tx81WK6Rv7AjbmmBPghIpwWwhCS4rMTwGCJwhCONwnghJZzoLlBJ8B
         tF3dwR1YyspedmORe/zQMno5iv9J4+MjGmLrOtbvXW38Jy0ct1kzeAfs5j48Ip+3WEoD
         5/yeNaCT3/0ehuMIP/LUthxIjH5QR+V3rH5mmmzlj/xyoouZ5x2HEQqxC/NWp7AHrr8i
         twiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=JeVliMOzTNqQeBzagfkyLUiT+u85etzXCJuLI3X8tSk=;
        b=VMDAM/yQiWIC3YevxZM6DHRNnZURoGH2TcO7BghHMvGJCr4vKtpiRdH8VKHK3KvVDr
         7NovJMbZdHulVIuruTEWC8T1+u5SwhtlXGdDmmMGBoTGN1lKwa/uD85pcGnnl5iFgPbu
         0F4mGu/3mNO9Ieh3N2FCYH8gUEgaXOvvbzTKriMgnmB5a1IKBjdS6DUdplxJ2nDsFrki
         I2hiucot7gyJm15BfX6K03976UuFWP3zOEYzh5Z2VVMtddozN4MUwnSVDvhv/Zv5vNVN
         t2nJ1pNsJoK9+CKoZNQRHyvCVqVBS0upXS+1Ux1NuePNOC2ooHbm4Mree/mmFMEiVEPK
         yK3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ndlhCptB;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::543 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JeVliMOzTNqQeBzagfkyLUiT+u85etzXCJuLI3X8tSk=;
        b=oJ0rvaoRiuv/1oQASWdjZD8VM1cY/uESOUreKjBsrv+30FL6lersyOAODav8AdmyHX
         6V9s6rl8z2gpUZCH82OcZsoWAASrTEDgiSExPNY1XbgQi5UtUnT1ZJwUC6oB7tMb+/S6
         aKWnZwvLwgVZNeCDdV5eI97jXwLr4GKQloRgZp05VMjR+YuFoFu2lVbPHg+HddlPJhdt
         y7ikbldXPdLBWCgE+hN+1ZC15g3efPpXqs0QDGj+A2AMJVOrkkIzkqtcR8zh6Ys11YRx
         GwoJblzEWkBgmGrvMZ2rky8TgRnoX9hW7tgipFMwLph5uubRNx0dBo2jjL6lRHOhvdRv
         MHGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JeVliMOzTNqQeBzagfkyLUiT+u85etzXCJuLI3X8tSk=;
        b=Uj6/69FfoDVWcS1swC5vIYdy25E+6jQ/7n6NFfTcRU45H+6/WTNTkLreRUH/MPDlyV
         UjuXkzy94kwqHj3mwIHucnK4sX6PxUxKymzddLwYvdh+u9pmXeFXgfdf91cB9ToAs5Ju
         EWYmymhOpQ180Onf43ZeP34moN4ycIGnMn6rlTTxbcJKR3Ku9nMkzdutaYxoVtUcPD7y
         u5Z0uv0TI4cvlETL8FpN6qIyQSn7hEx4xWRm9dwmfP5sm+iUc4wg5KcbQfzyM8zO7zSe
         2FY2EUVyVgtJkUsMw8JjnMziPxbrca3pMvB3jvDphcJTuvYj0ikjV+WF0+JB7iy5Ge7t
         IGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JeVliMOzTNqQeBzagfkyLUiT+u85etzXCJuLI3X8tSk=;
        b=BHAYc7cClWs1L2vY4+PJWsrIbNhIMPzSC1kI4v6ul8bFL+be0isSNyquaVFjqcRxgR
         rgNM3lDjF4LHp3rZLYXuTaEFoylKahnPunY6aVwVvE8g/aS0NHAYvYw4T0wg5pbXOL18
         6EW+ZOEbIIOek6eTyNFXjWnd8Tx+5T6fGTlc246R4AIWRtQAPQvyORhd6kREkTqgd6so
         9eOFGGY44DOhqXcA+Fa12S/fmz+uo+DN5jhFgXq2iHLjR2Wy3KqAcDYJ5jSD+8X9m40m
         X0aU/IA+m5BXHQ0WWtp7eUHsRO+H62lVE0ClDfTXKfsVh0ih9JuBg8UyJcb2wOC138EA
         8Ctw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVYpob72neIF5AVCPPNQtapBZGJTyEWFILasfbfSU85xZZ/X4t3
	dVRY+bFzafDF7oyQYetmp/Q=
X-Google-Smtp-Source: APXvYqy1TxGIhImlqam/L8yBTzoSsxIOkCIuboNWbbfpb8X99zoGRJ0Qgr5qUltAt/9GJIJpsnjePg==
X-Received: by 2002:aca:3109:: with SMTP id x9mr2936507oix.107.1580811206493;
        Tue, 04 Feb 2020 02:13:26 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:895:: with SMTP id 143ls730440oii.1.gmail; Tue, 04 Feb
 2020 02:13:25 -0800 (PST)
X-Received: by 2002:aca:2813:: with SMTP id 19mr2940537oix.76.1580811205909;
        Tue, 04 Feb 2020 02:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580811205; cv=none;
        d=google.com; s=arc-20160816;
        b=EIwxDTgoqIYWy7VBA1A6hU5SQsLqutFB6Gd3yh+WBVLN8dZq5zId8kzX1h+cYNZYqr
         sEo0W/Q4a/CrLaVThi5Wy1qQauF/Jf2AgKT91Hl1LlB1tpORMkWns4++6QYIwynEmuyI
         6MlmH4Riwq5gf4qb1aDxVy1Houvq05wgXuIQdmj2fpt9oyujUVG/XesdmF3Ektn/fvTR
         2Aqdy5ASXJ+km0uVdS6p9t9ZOjF59/KOBufvDmXN70fb4R5mKznxBHBCEHrKT6jvHUFO
         MEKm7iZhqYB2yQj+jskGwlPX7JyTSNboKclW5qL03h96WLfDysyOp2/JdEnjKd7+WORn
         37Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=3BFUvXWc0E7Xeu6PACi1hLAV4nnXtqnohDmG33CcWN8=;
        b=jHMKDVvllCd+fFn4skzyq5szUVSVVf2DDAJoum3y8iHdumvx10U0PzrivOBlpLIyU9
         Gx/V4MixymeF4FAOabF1JJ3d0dPw8Z94aLEoIevrMbWTeEf5IeFzEVCsj6JU5lGjAS2z
         lTYWELlJOGEDhNUvpfoYcfjLXudhQ1OL8xL+8ypcVy3L3HaQ9zshq54OmqB6yC5BqW6P
         F63+hN2HxL0LRTmDtMsWm97zKhBdWLCCbfnB7G+pCs/4K5xyeV6ZVdVRaA0vqTIQ8cMR
         8N5qRsHK7/fqsN/c+CHg8sJljhcU+wzSBAigWkxZ6WO9uohJzqPP7lcFSWoK/pby8fv2
         zHmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ndlhCptB;
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::543 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com. [2607:f8b0:4864:20::543])
        by gmr-mx.google.com with ESMTPS id 14si695982oty.3.2020.02.04.02.13.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 02:13:25 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2607:f8b0:4864:20::543 as permitted sender) client-ip=2607:f8b0:4864:20::543;
Received: by mail-pg1-x543.google.com with SMTP id k3so9428807pgc.3
        for <jailhouse-dev@googlegroups.com>; Tue, 04 Feb 2020 02:13:25 -0800 (PST)
X-Received: by 2002:a63:3103:: with SMTP id x3mr29707382pgx.44.1580811204948;
        Tue, 04 Feb 2020 02:13:24 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id p24sm22834066pgk.19.2020.02.04.02.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 02:13:24 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v3 0/3] Add support for Pine64+ board
Date: Tue,  4 Feb 2020 15:43:10 +0530
Message-Id: <20200204101313.2495-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=ndlhCptB;       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2607:f8b0:4864:20::543 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Jan,

Sorry. It took sometime to send this v3.

As suggested, I have added the ivshmem-demo and linux-demo
as well.

Changes since v2:

- Added support for ivshmem-demo
- Added support for linux-demo
- Rebased on top of next

Thanks,
Vijai Kumar K


Vijai Kumar K (3):
  configs/arm64: Add support for pine64-plus board
  configs/arm64: Add inmate demo for pine64-plus board
  Add Linux demo for pine64-plus

 configs/arm64/dts/inmate-pine64-plus.dts | 114 +++++++
 configs/arm64/pine64-plus-inmate-demo.c  | 131 ++++++++
 configs/arm64/pine64-plus-linux-demo.c   | 149 +++++++++
 configs/arm64/pine64-plus.c              | 376 +++++++++++++++++++++++
 4 files changed, 770 insertions(+)
 create mode 100644 configs/arm64/dts/inmate-pine64-plus.dts
 create mode 100644 configs/arm64/pine64-plus-inmate-demo.c
 create mode 100644 configs/arm64/pine64-plus-linux-demo.c
 create mode 100644 configs/arm64/pine64-plus.c

-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200204101313.2495-1-vijaikumar.kanagarajan%40gmail.com.
