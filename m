Return-Path: <jailhouse-dev+bncBCQNPWN43YJRBFNU76LAMGQEGTSLGEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3b.google.com (mail-vk1-xa3b.google.com [IPv6:2607:f8b0:4864:20::a3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D36B5812E1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Jul 2022 14:12:07 +0200 (CEST)
Received: by mail-vk1-xa3b.google.com with SMTP id l81-20020a1f2554000000b0037443bf4bb9sf2645445vkl.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 26 Jul 2022 05:12:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1658837526; cv=pass;
        d=google.com; s=arc-20160816;
        b=pIbdvCjNtJXG6v8ut4skk6hOWy+jPh2MnvXrfYteKMwbB0egq9wPsYhZvtmXi9tfaG
         kf4Cvk1Rg+Uf0R2ca1QbxGBDvH6UFNiQAKbCfSvxWgXheTUAki5BMyEIQKCEw8s+iEyh
         x1q5y+6t3apvfrJPQF5pYXiI7b0sqeW4VWeFlE2GWh6f98S1RiEFYAn3VPge6YnOjofk
         zdgxZlfRWP7eNqYuDZx3EpOGlmqzCf3Sf1UMMB2DwUGkw82Nja+SaBiQ8O3h8b8y5fbe
         T7eup3LZa449EhVayxT5Wzt8CpnJjDM6z/4Ly3+gNMv++dSjSLDnBMNbvYKVegd2kvCP
         pX9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=Z53Rjicvn0Htl6JXWfedOdvocVw05JvK/eS1meCVSsQ=;
        b=wvAibsOf1ky1aww5k9SZ9dvfTgdIs307TSMFEDYPENotnt030puk57u2yhPatiyslU
         oa0Fx6yZphezIIPOgEjaCSlk6IJ+lecpdorEIyzQsotTVSdO2LchqaJ1uIF9ONsz+9/9
         DGqAdmR8NMRrOGAMikVoYihz2uGp0p2n98HNWBHuiOmWaDkytVLgi3fieJ6hCgO0npp2
         1Qp9Plas3L4w9WGlbSSVg0RX5bYkzrgIRnF2jVaKjP5G/2qD3dpp17fF++uU0g5YqoFb
         OG6W+4hoGEB023TrvyMPrmxmyxraq+GzYjVKHVvTs2QaTWr+yOdI9P0BxajPXbVJCFXT
         mWwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TU4yjLuO;
       spf=pass (google.com: domain of nadazaki0165@gmail.com designates 2607:f8b0:4864:20::433 as permitted sender) smtp.mailfrom=nadazaki0165@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z53Rjicvn0Htl6JXWfedOdvocVw05JvK/eS1meCVSsQ=;
        b=HsXKXDl/Y1qIwTI/vR6hUUjamSWOGd5DZhqyJyNQY2URjsoZelPabRt+b8EkOcqHwW
         xU88Fzu1ZthSyPyls8Y701NuvczJIca6jZGGsFLe4adoO1WC1ZqipHkw5djMhiuN95it
         Wqm1Bl7G4c93k3Y2+O6iigBlaVGNniJDmlnn86cfTpWgxX6XUOD0mW8rAq8WBGvtN3bw
         SFEAVn+sWVZ9ihZ9uDJWnvKaamc0WCepOxxd2+il3ctR3FsEfDMjG5BbQTJF6AWaKIn1
         Xm70CNcveEr6zo4KNvX00voCN5zZuDZG+UynMz/U7xSIos9YB5zwEl2MsFnzTIhNPjRK
         NTWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Z53Rjicvn0Htl6JXWfedOdvocVw05JvK/eS1meCVSsQ=;
        b=ZwxWnzztbXFJqjAFDJEioh7seD31yhpc2U1Q/ioaFAM+bmJ3+N6TFbXILFVc3EPAd0
         GHuO/pJANaCtHBYHShBn0lZlIEDGnxx2jQb753WdQpXWCdKG79XD3iCdT6K/IO1Ft/cj
         /6Cdqt4PN5xND12iYZmZ834QoJR6YN3XL95YIhoEuIrA90Zd1jub87ajwcTzviADvp/3
         +8ew9UEAMIgY8+ROr0sc9PJaXL2WZSHiDJzkxYn5eEppQ7oHy/iR24kbexMa+vOlmWPX
         TBZSqBjiL1w7bwjFYi1urQN3Qx0QWLyxkXSomVY+OgPgPpnBdXAxO2PmTtqz84uNLI87
         hVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Z53Rjicvn0Htl6JXWfedOdvocVw05JvK/eS1meCVSsQ=;
        b=pyqM2iHjFrr46nySqifVKcBn+WA2yxNXNWRBAUYFjTsbwpyQZpAMK0K97PVG5Nsl/F
         7qIVt9ew9EVuYm2zDKBeKAS9R+S6ObXjRkh2Di4ucB4ddjakqbhBVdqX6ptqtg/iXDjk
         NSaQ0es0geAgC9bcLaD1EMnFwMiWgjE/+//7yzEXCjRl66C1cKFnwphjRgUGGZEVYtHg
         yBPDvakaAYFd2zipAEIJCdAGhQ1w6QjfGFTkJlLs1mD9eYWTcKk5vjP7CWnRjIxG7PIs
         Jna7ni58eTs2Uxxk01dZGD9CCuylUipHwm4war/ZYxNS0HhMPaxUwT7O70EHWXq0n7w7
         fv4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9VFNBEfA/tbW26UTuGkeMeUYCH5XNZwNxjA04PzxzsVyIuRMtb
	BdIuzAgHq0ZgGSxZtaYgLrs=
X-Google-Smtp-Source: AGRyM1s2eBzAiaRRpH8eIpY34fSryIv9siHPlLB6bswDcr9LqhA/HfOs8p7Kau4vFnJrQdxkTyRcag==
X-Received: by 2002:a67:f148:0:b0:358:3c39:116a with SMTP id t8-20020a67f148000000b003583c39116amr5665616vsm.80.1658837525927;
        Tue, 26 Jul 2022 05:12:05 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:c788:0:b0:359:74d6:8630 with SMTP id t8-20020a67c788000000b0035974d68630ls79835vsk.4.-pod-prod-gmail;
 Tue, 26 Jul 2022 05:12:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2432:b0:357:4793:d267 with SMTP id l18-20020a056102243200b003574793d267mr4758582vsi.83.1658837524946;
        Tue, 26 Jul 2022 05:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658837524; cv=none;
        d=google.com; s=arc-20160816;
        b=fwaRlYdzKocZ0bz9El40Kz/TJov4Dedn5g6zWk98VmazWM5aI+cs0DjKgEGV02wY+x
         cX9EIHY2ecwQwEDZtFXlkp0fbfXba1oCuE0dSCHDC/K63kafLehRW2VlFot4MGnQDj7M
         ieA7hSFUcz9syOxFzOFRfvDXZJ/mpIuq8YbiBBh1jc9GtNMMCd92urtslb+94JBFsoq1
         LOlN5eURjO8g1TL6nm7v3ZBUZikw3+iY6VESbnI/0Y1wAz59j+qy4s0VTS9Vqp4ME3Br
         ZG2ll/w3KS+D5AJ9ViIWsZwOs70/S/tYp3nI3nDuJUJBeU39ZXAylAS1jXxv68i2Xb3h
         WtcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=N70L1eyYVbSit1viE6Jr3CeCr/GZam5cwh42Nk7ysjk=;
        b=sCr8MrXm4JOzGgnjyvBMQecJCCkSYtUwP/m+wJGMdIXXiiv+z9vBrucvwMKn3xq/2+
         oKPiOF7fHxZWnygbb/ErXj6ohR+UvCny12opEwJoABCAjCb4RlX5Mb9MkVAWtc7fy5XF
         lNWKAyMkSTaO/p8+iCO4wm8uSGPiHM1sZH3dGC++odwJqn4OOsJFEOisUKgdTJXz3tmT
         ygqSO35slM1UZ1Ion35Y9RDRPGzxUvUE2582cuykwLSZMPc4/Fqtqqs98/Qc74ZHMM1A
         B36eGQ2af3hBitE5tbIQwuMy/H68G39HX+y3OeLEttOjb1uaGD8vxslsvEoDVURFcxlH
         WgRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TU4yjLuO;
       spf=pass (google.com: domain of nadazaki0165@gmail.com designates 2607:f8b0:4864:20::433 as permitted sender) smtp.mailfrom=nadazaki0165@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com. [2607:f8b0:4864:20::433])
        by gmr-mx.google.com with ESMTPS id a7-20020a67eb07000000b003583728371esi407723vso.1.2022.07.26.05.12.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 05:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of nadazaki0165@gmail.com designates 2607:f8b0:4864:20::433 as permitted sender) client-ip=2607:f8b0:4864:20::433;
Received: by mail-pf1-x433.google.com with SMTP id w185so13066833pfb.4
        for <jailhouse-dev@googlegroups.com>; Tue, 26 Jul 2022 05:12:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:ac5:b0:52b:bd67:c11 with SMTP id
 c5-20020a056a000ac500b0052bbd670c11mr17243702pfl.61.1658837523590; Tue, 26
 Jul 2022 05:12:03 -0700 (PDT)
MIME-Version: 1.0
From: nada zaki0165 <nadazaki0165@gmail.com>
Date: Tue, 26 Jul 2022 14:11:51 +0200
Message-ID: <CAAMCtORUOVaJvLuPUzZk0fQPBFAyTFpC5KMzs5EoLxj_z+BqAQ@mail.gmail.com>
Subject: =?UTF-8?B?2KfYrdiq2LHZgSDZhdis2KfZhCDYp9mE2KrYs9mI2YrZgiDYp9mE2KfZhNmD2KrYsdmI?=
	=?UTF-8?B?2YbZiiDZhdmGIDMxINmK2YjZhNmK2Ygg4oCTIDQg2KfYutiz2LfYsyAyMDIyINit2LbZiNixINin2YE=?=
	=?UTF-8?B?2KrYsdin2LbZiiDYudio2LEg2YXZhti12Kkg2LLZiNmI2YjZhSDZgdmJINit2KfZhCDYqti52KvYsSA=?=
	=?UTF-8?B?2KfZhNit2LbZiNixIDAwMjAxMDYyOTkyNTEwINio2LPZhSDYp9mE2YTZhyDYp9mE2LHYrdmF2YYg2Kc=?=
	=?UTF-8?B?2YTYsdit2YrZhSDYp9mE2LPZhNin2YUg2LnZhNmK2YPZhSDZiNix2K3ZhdipINin2YTZhNmHINmI2Kg=?=
	=?UTF-8?B?2LHZg9in2KrYqSDYqtmH2K/ZitmD2YUg2KfZhNiv2KfYsSDYp9mE2LnYsdio2YrYqSDZhNmE2KrZhtmF?=
	=?UTF-8?B?2YrYqSDYp9mE2KfYr9in2LHZitipINin2YTYr9io2YTZiNmFINin2YTYqtiv2LHZitio2Yog2YHZiiA=?=
	=?UTF-8?B?2KfZhNiq2LPZiNmK2YIg2KfZhNin2YTZg9iq2LHZiNmG2Yog2KfZhNin2K3Yqtix2KfZgdmKINio2Kc=?=
	=?UTF-8?B?2YTYqti52KfZiNmGINmF2LkgMS0g2YjYstin2LHYqSDYp9mE2KrYsdio2YrYqSDZiNin2YTYqti52YQ=?=
	=?UTF-8?B?2YrZhSAyX9mF2LHZg9iyINin2YTZgtin2YfYsdipINmE2KrZhtmF2YrYqSDYp9mE2YXZiNin2LHYryA=?=
	=?UTF-8?B?2KfZhNio2LTYsdmK2KkgM18g2YXYrdin2YHYuNipINin2YTZgtin2YfYsdipIDTigJMg2KfZhNmF2Lk=?=
	=?UTF-8?B?2YfYryDYp9mE2YLZiNmF2Yog2YTZhNis2YjYr9ipIDUtINmI2LLYp9ix2Kkg2KfZhNiq2KzYp9ix2Kkg?=
	=?UTF-8?B?2YjYp9mE2LXZhtin2LnYqSA2LSDYqNiq2LXYr9mK2YIg2YXZhiDZiNiy2KfYsdipINin2YTYrtin2LE=?=
	=?UTF-8?B?2KzZitipINij2YLZiNmJINi02YfYp9iv2Kkg2YHZiiDYp9mE2KrYs9mI2YrZgiDYudio2LHYp9mE2Kc=?=
	=?UTF-8?B?2YbYqtix2YbYqiDZhdmGIDMxINmK2YjZhNmK2Ygg4oCTIDQg2KfYutiz2LfYsyAyMDIyINit2LbZiNix?=
	=?UTF-8?B?INin2YHYqtix2KfYttmKINi52KjYsSDZhdmG2LXYqSDYstmI2YjZiNmFINmB2Ykg2K3Yp9mEINiq2Lk=?=
	=?UTF-8?B?2KvYsSDYp9mE2K3YttmI2LEg2KrZgdin2LXZitmEINmI2YXYrdin2YjYsSDYp9mE2K/YqNmE?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="0000000000005575f105e4b4354e"
X-Original-Sender: nadazaki0165@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=TU4yjLuO;       spf=pass
 (google.com: domain of nadazaki0165@gmail.com designates 2607:f8b0:4864:20::433
 as permitted sender) smtp.mailfrom=nadazaki0165@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--0000000000005575f105e4b4354e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

Ktin2K3Yqtix2YEg2YXYrNin2YQg2KfZhNiq2LPZiNmK2YIg2KfZhNin2YTZg9iq2LHZiNmG2Yog
ICrZhdmGIDMxINmK2YjZhNmK2Ygg4oCTIDQg2KfYutiz2LfYsyAyMDIyICDYrdi22YjYsSDYp9mB
2KrYsdin2LbZig0K2LnYqNixINmF2YbYtdipINiy2YjZiNmI2YUg2YHZiSDYrdin2YQg2KrYudir
2LEg2KfZhNit2LbZiNixIDAwMjAxMDYyOTkyNTEwDQoNCg0KDQoq2KjYs9mFINin2YTZhNmHINin
2YTYsdit2YXZhiDYp9mE2LHYrdmK2YUqDQoNCirYp9mE2LPZhNin2YUg2LnZhNmK2YPZhSDZiNix
2K3ZhdipINin2YTZhNmHINmI2KjYsdmD2KfYqtipKg0KDQoq2KrZh9iv2YrZg9mFINin2YTYr9in
2LEg2KfZhNi52LHYqNmK2Kkg2YTZhNiq2YbZhdmK2Kkg2KfZhNin2K/Yp9ix2YrYqSoNCg0KKtin
2YTYr9io2YTZiNmFINin2YTYqtiv2LHZitio2Yog2YHZiiDYp9mE2KrYs9mI2YrZgiDYp9mE2KfZ
hNmD2KrYsdmI2YbZiiDYp9mE2KfYrdiq2LHYp9mB2YoqDQoNCirYqNin2YTYqti52KfZiNmGINmF
2LkqDQoNCioxLSDZiNiy2KfYsdipINin2YTYqtix2KjZitipINmI2KfZhNiq2LnZhNmK2YUqDQoN
CioyX9mF2LHZg9iyINin2YTZgtin2YfYsdipINmE2KrZhtmF2YrYqSDYp9mE2YXZiNin2LHYryDY
p9mE2KjYtNix2YrYqSoNCg0KKjNfINmF2K3Yp9mB2LjYqSDYp9mE2YLYp9mH2LHYqSoNCg0KKjTi
gJMg2KfZhNmF2LnZh9ivINin2YTZgtmI2YXZiiDZhNmE2KzZiNiv2KkqDQoNCio1LSDZiNiy2KfY
sdipINin2YTYqtis2KfYsdipINmI2KfZhNi12YbYp9i52KkqDQoNCio2LSDYqNiq2LXYr9mK2YIg
2YXZhiDZiNiy2KfYsdipINin2YTYrtin2LHYrNmK2KkqDQoNCiAq2KPZgtmI2Ykg2LTZh9in2K/Y
qSDZgdmKINin2YTYqtiz2YjZitmCINi52KjYsdin2YTYp9mG2KrYsdmG2KoqDQoNCirZhdmGIDMx
INmK2YjZhNmK2Ygg4oCTIDQg2KfYutiz2LfYsyAyMDIyKg0KDQoq2K3YttmI2LEg2KfZgdiq2LHY
p9i22Yog2LnYqNixINmF2YbYtdipINiy2YjZiNmI2YUg2YHZiSDYrdin2YQg2KrYudir2LEg2KfZ
hNit2LbZiNixKg0KDQoNCg0KKtiq2YHYp9i12YrZhCDZiNmF2K3Yp9mI2LEg2KfZhNiv2KjZhNmI
2YUg2KfZhNiq2K/YsdmK2KjZiioNCg0KKtio2LHZhtin2YXYrCDYqtiv2LHZitio2Yog2KrZhSDY
qti12YXZitmF2Ycg2K7YtdmK2LXYpyDZhNmE2LHYp9i62KjZitmGINio2KfZhNi52YXZhCDZgdmK
INmF2KzYp9mEINin2YTYqtiz2YjZitmCINin2YTYp9mE2YPYqtix2YjZhtmKDQrYrdmK2Ksg2YrY
uti32Yog2KzZhdmK2Lkg2KzZiNin2YbYqCDYp9mE2KrYs9mI2YrZgiDYp9mE2KfZhNmD2KrYsdmI
2YbZitiMINmI2YLYryDYqtmFINiq2LXZhdmK2YUg2KrZhNmDINin2YTYr9mI2LHYqSDYp9mE2KrY
r9ix2YrYqNmK2KkNCtmE2KrZhtin2LPYqCDYrNmF2YrYuSDYp9mE2YXYs9iq2YjZitin2KrYjCDZ
hdmGINin2YTZhdio2KrYr9im2YrZhiDZiNit2KrZiSDYp9mE2YXYrdiq2LHZgdmK2YbYjCDZhNij
2YYg2KfZhNiv2YjYsdipINiq2LrYt9mKINin2YfZhQ0K2KfZhNmF2K3Yp9mI2LEg2KfZhNmF2LHY
qtio2LfYqSDYqNmF2KzYp9mEINin2YTYqtiz2YjZitmCINin2YTYp9mE2YPYqtix2YjZhtmK2Iwg
2YjYp9i02YfYp9ixINmF2YjYp9mC2Lkg2KfZhNin2YbYqtix2YbYqtiMINmI2KfZhNmC2KfYoQ0K
2KfZhNi22YjYoSDYudmE2Ykg2KfYs9iq2LHYp9iq2YrYrNmK2KfYqiDYp9mE2KrYs9mI2YrZgiDY
p9mE2KfZhNmD2KrYsdmI2YbZitiMINio2YXYpyDZiti22YXZhiDZhNmE2YXYtNin2LHZg9mK2YYg
2YHZiiDZh9iw2Ycg2KfZhNiv2YjYsdipDQrYp9mE2KrYr9ix2YrYqNmK2Kkg2KfZhNmI2LXZiNmE
INin2YTZiSDZhdiz2KrZiNmJINin2YTZhdit2KrYsdmB2YrZhiDZgdmKINin2YTYqtiz2YjZitmC
INin2YTYp9mE2YPYqtix2YjZhtmK2Iwg2KjZhdi02KfYsdmD2KrZgyDZgdmKINmH2LDZhw0K2KfZ
hNiv2YjYsdip2Iwg2YHYo9mG2Kog2KrYr9iu2YQg2YfYsNinINin2YTZhdis2KfZhCDZiNiq2LXY
qNitINmI2KfYrdiv2Kcg2YXZhiDYp9mE2YXYrdiq2LHZgdmK2YYg2YHZiiDYp9mE2KrYs9mI2YrZ
gg0K2KfZhNin2YTZg9iq2LHZiNmG2YrYjCDYqtiq2YUg2KfZhNiv2LHYp9iz2Kkg2YHZiiDZh9iw
2Ycg2KfZhNiv2YjYsdipINin2YTYqtiv2LHZitio2YrYqSDYp9mI2YYg2YTYp9mK2YYg2LnYqNix
INin2YTYp9mG2KrYsdmG2Kog2KjZhti42KfZhQ0K2KfZhNiq2K/YsdmK2Kgg2LnZhiDYqNi52K8u
Kg0KDQoq2KfZhNij2YfYr9in2YEg2KfZhNiq2K/YsdmK2KjZitipKg0KDQoqwrcgICAgICAgICAq
KtmF2LnYsdmB2Kkg2LfYsdmCINmI2KPYr9mI2KfYqiDZiNin2LPYqtix2KfYqtmK2KzZitin2Kog
2KfZhNiq2LPZiNmK2YIg2KfZhNil2YTZg9iq2LHZiNmG2Yog2YjZg9mK2YHZitipDQrYp9iz2KrY
rtiv2KfZhdmH2Kcg2YHZiiDYqtiz2YjZitmCINin2YTYs9mE2Lkg2YjYp9mE2K7Yr9mF2KfYqiAu
Kg0KDQoqwrcgICAgICAgICAqKti52YXZhCDYrti32Kkg2KrYs9mI2YrZgtmK2Kkg2KrYqtmG2KfY
s9ioINmF2Lkg2KfZhNmF2YbYqtis2KfYqiDZiNin2YTYrtiv2YXYp9iqINin2YTYqtmKINiq2YLY
r9mF2YfYpw0K2YTYudmF2YTYp9im2YMuKg0KDQoqwrcgICAgKirYp9mE2KrYudix2YEg2LnZhNmK
INmD2YrZgdmK2Kkg2K3ZhCDYp9mE2YXYtNin2YPZhCDYp9mE2KrZiiDYqti52KrYsdi2INi52YXZ
hNmK2Kkg2KfZhNiq2LPZiNmK2YIg2YjZg9mK2YHZitipINil2YrYrNin2K8NCtin2YTYqNiv2KfY
ptmEIC4qDQoNCirZhNiq2KPZg9mK2K8g2YXYtNin2LHZg9iq2YPZhSAqKtin2YTYtNmH2KfYr9ip
Kiog2KfZhNmF2LDZg9mI2LHYqSDYp9i52YTYp9mHINmK2LHYrNmJINin2YTYqtmI2KfYtdmEINmF
2Lkg2KMvINiz2KfYsdipINi52KjYrw0K2KfZhNis2YjYp9ivIOKAkyDYrNmI2KfZhCAmINmI2KfY
qtizINin2KggMDAyMDEwNjI5OTI1MTAgLSAwMDIwMTA5Njg0MTYyNioNCg0KDQoNCirZiti52YLY
ryDZgdmKINmG2YHYsyDYp9mE2KrYp9ix2YrYriA6LSoNCg0KMS4g2LTZh9in2K/YqSDZhdiv2YrY
sSDYrNmI2K/YqSDZhdi52KrZhdivDQoNCjIuINi02YfYp9iv2Kkg2YXYr9mK2LEg2KrZiNmD2YrY
ryDYp9mE2KzZiNiv2Kkg2KfZhNmF2LnYqtmF2K8NCg0KMy4g2LTZh9in2K/YqSDZhdiv2YrYsSDZ
hdix2KfZgtio2Kkg2KfZhNis2YjYr9ipINin2YTZhdi52KrZhdivDQoNCjQuINi02YfYp9iv2Kkg
2YXYr9mK2LEg2KXYr9in2LHYqSDYp9mE2YXYrtin2LfYsSDYp9mE2YXYudiq2YXYrw0KDQo1LiDY
tNmH2KfYr9ipINmF2K/ZitixINin2YTYqNmK2KbZitipINin2YTZhdi52KrZhdivDQoNCjYuINi0
2YfYp9iv2Kkg2YXYr9mK2LEg2KfZhNiz2YTYp9mF2Kkg2YjYp9mE2LXYrdipINin2YTZhdmH2YbZ
itipINin2YTZhdi52KrZhdivDQoNCjcuINi02YfYp9iv2Kkg2YXYr9mK2LEg2LPZhNin2YXYqSDY
p9mE2LrYsNin2KEg2KfZhNmF2LnYqtmF2K8NCg0KOC4g2LTZh9in2K/YqSDZhdiv2YrYsSDYp9mE
2YXYrtiq2KjYsdin2Kog2KfZhNmF2LnYqtmF2K8NCg0KOS4g2LTZh9in2K/YqSDZhdiv2YrYsSDY
o9mF2YYg2KfZhNmF2LnZhNmI2YXYp9iqIElTTyAyNzAwMQ0KDQoxMC4gICAgICAgICAgICAgICAg
ICDYtNmH2KfYr9ipINmF2K/ZitixINiq2YPZhtmI2YTZiNis2YrYpyDYp9mE2YXYudmE2YjZhdin
2KogSVNPIC8gSUVDIDIwMDAwDQoNCjExLiAgICAgICAgICAgICAgICAgINi02YfYp9iv2Kkg2YXY
r9mK2LEg2KrZgtmK2YrZhSDYp9mE2YXYt9in2KjZgtipINmE2LTYsdmD2KfYqiDYp9mE2KrZgdiq
2YrYtCBJU08gLyBJRUMNCjE3MDIwDQoNCjEyLiAgICAgICAgICAgICAgICAgINi02YfYp9iv2Kkg
2YXYr9mK2LEg2LnZhNin2YXYqSDYp9mE2YXYt9in2KjZgtipINin2YTYo9mI2LHZiNio2YrYqSDY
p9mE2YXYudiq2YXYryBDRSBNYXJrDQoNCjEzLiAgICAgICAgICAgICAgICAgINi02YfYp9iv2Kkg
2YXYr9mK2LEg2KfZhNiq2K7Yt9mK2Lcg2KfZhNmF2LnYqtmF2K8NCg0KMTQuICAgICAgICAgICAg
ICAgICAg2LTZh9in2K/YqSDZhdiv2YrYsSDYpdiv2KfYsdipINin2YTZhdmI2KfYsdivINin2YTY
qNi02LHZitipINin2YTZhdi52KrZhdivDQoNCjE1LiAgICAgICAgICAgICAgICAgINi02YfYp9iv
2Kkg2YXYr9mK2LEg2KfZhNi12YrYp9mG2Kkg2KfZhNmF2LnYqtmF2K8NCg0KMTYuICAgICAgICAg
ICAgICAgICAg2LTZh9in2K/YqSDZhdiv2YrYsSDYp9mE2KfZhtiq2KfYrCDYp9mE2YXYudiq2YXY
rw0KDQoxNy4gICAgICAgICAgICAgICAgICDYtNmH2KfYr9ipINmF2K/ZitixINin2YTZhdiu2KfY
stmGINmI2KfZhNmF2LPYqtmI2K/Yudin2Kog2KfZhNmF2LnYqtmF2K8NCg0KMTguICAgICAgICAg
ICAgICAgICAg2LTZh9in2K/YqSDZhdiv2YrYsSDYp9mE2KrYs9mI2YrZgiDYp9mE2YXYudiq2YXY
rw0KDQotLSAKWW91IHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBiZWNhdXNlIHlvdSBhcmUgc3Vic2Ny
aWJlZCB0byB0aGUgR29vZ2xlIEdyb3VwcyAiSmFpbGhvdXNlIiBncm91cC4KVG8gdW5zdWJzY3Jp
YmUgZnJvbSB0aGlzIGdyb3VwIGFuZCBzdG9wIHJlY2VpdmluZyBlbWFpbHMgZnJvbSBpdCwgc2Vu
ZCBhbiBlbWFpbCB0byBqYWlsaG91c2UtZGV2K3Vuc3Vic2NyaWJlQGdvb2dsZWdyb3Vwcy5jb20u
ClRvIHZpZXcgdGhpcyBkaXNjdXNzaW9uIG9uIHRoZSB3ZWIgdmlzaXQgaHR0cHM6Ly9ncm91cHMu
Z29vZ2xlLmNvbS9kL21zZ2lkL2phaWxob3VzZS1kZXYvQ0FBTUN0T1JVT1ZhSnZMdVBVelprMGZR
UEJGQXlURnBDNUtNenM1RW9MeGpfeiUyQkJxQVElNDBtYWlsLmdtYWlsLmNvbS4K
--0000000000005575f105e4b4354e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=
=3D"text-align:center;margin:0in 0in 10pt;line-height:115%;direction:rtl;un=
icode-bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"=
><b><span lang=3D"AR-SA" style=3D"font-size:26pt;line-height:115%;font-fami=
ly:Arial,&quot;sans-serif&quot;;color:red">=D8=A7=D8=AD=D8=AA=D8=B1=D9=81 =
=D9=85=D8=AC=D8=A7=D9=84 =D8=A7=D9=84=D8=AA=D8=B3=D9=88=D9=8A=D9=82
=D8=A7=D9=84=D8=A7=D9=84=D9=83=D8=AA=D8=B1=D9=88=D9=86=D9=8A =C2=A0</span><=
/b><span lang=3D"AR-SA" style=3D"font-size:22pt;line-height:115%;font-famil=
y:Arial,&quot;sans-serif&quot;">=D9=85=D9=86 31 =D9=8A=D9=88=D9=84=D9=8A=D9=
=88 =E2=80=93 4 =D8=A7=D8=BA=D8=B3=D8=B7=D8=B3 2022=C2=A0 =D8=AD=D8=B6=D9=
=88=D8=B1 =D8=A7=D9=81=D8=AA=D8=B1=D8=A7=D8=B6=D9=8A =D8=B9=D8=A8=D8=B1 =D9=
=85=D9=86=D8=B5=D8=A9 =D8=B2=D9=88=D9=88=D9=88=D9=85 =D9=81=D9=89 =D8=AD=D8=
=A7=D9=84 =D8=AA=D8=B9=D8=AB=D8=B1 =D8=A7=D9=84=D8=AD=D8=B6=D9=88=D8=B1
00201062992510</span><span lang=3D"AR-SA" style=3D"font-size:22pt;line-heig=
ht:115%;font-family:Arial,&quot;sans-serif&quot;"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><u><span lang=3D"=
AR-SA" style=3D"font-size:26pt;line-height:115%;font-family:Andalus,&quot;s=
erif&quot;;color:red"><span style=3D"text-decoration-line:none">=C2=A0</spa=
n></span></u></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><u><span lang=3D"=
AR-EG" style=3D"font-size:26pt;line-height:115%;font-family:Andalus,&quot;s=
erif&quot;;color:red">=D8=A8=D8=B3=D9=85 =D8=A7=D9=84=D9=84=D9=87 =D8=A7=D9=
=84=D8=B1=D8=AD=D9=85=D9=86 =D8=A7=D9=84=D8=B1=D8=AD=D9=8A=D9=85</span></u>=
</p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><u><span lang=3D"=
AR-EG" style=3D"font-size:26pt;line-height:115%;font-family:Andalus,&quot;s=
erif&quot;;color:rgb(38,38,38)">=D8=A7=D9=84=D8=B3=D9=84=D8=A7=D9=85
=D8=B9=D9=84=D9=8A=D9=83=D9=85 =D9=88=D8=B1=D8=AD=D9=85=D8=A9 =D8=A7=D9=84=
=D9=84=D9=87 =D9=88=D8=A8=D8=B1=D9=83=D8=A7=D8=AA=D8=A9</span></u></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><u><span lang=3D"=
AR-EG" style=3D"font-size:26pt;line-height:115%;font-family:Arial,&quot;san=
s-serif&quot;;color:rgb(38,38,38)">=D8=AA=D9=87=D8=AF=D9=8A=D9=83=D9=85 =D8=
=A7=D9=84=D8=AF=D8=A7=D8=B1 =D8=A7=D9=84=D8=B9=D8=B1=D8=A8=D9=8A=D8=A9 =D9=
=84=D9=84=D8=AA=D9=86=D9=85=D9=8A=D8=A9
=D8=A7=D9=84=D8=A7=D8=AF=D8=A7=D8=B1=D9=8A=D8=A9</span></u><span lang=3D"AR=
-EG" style=3D"font-size:26pt;line-height:115%;font-family:Arial,&quot;sans-=
serif&quot;;color:rgb(38,38,38)"></span></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;directio=
n:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:11p=
t;font-family:Calibri,&quot;sans-serif&quot;"><b><u><span lang=3D"AR-EG" di=
r=3D"RTL" style=3D"font-size:24pt;line-height:115%;font-family:Arial,&quot;=
sans-serif&quot;;color:red">=D8=A7=D9=84=D8=AF=D8=A8=D9=84=D9=88=D9=85 =D8=
=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=D8=A8=D9=8A =D9=81=D9=8A =D8=A7=D9=84=D8=
=AA=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=D9=84=D8=A7=D9=84=D9=83=D8=AA=D8=B1=D9=
=88=D9=86=D9=8A
=D8=A7=D9=84=D8=A7=D8=AD=D8=AA=D8=B1=D8=A7=D9=81=D9=8A</span></u></b><b><u>=
<span style=3D"font-size:24pt;line-height:115%;color:red"></span></u></b></=
p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;backgrou=
nd-image:initial;background-position:initial;background-size:initial;backgr=
ound-repeat:initial;background-origin:initial;background-clip:initial;direc=
tion:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"AR-EG" di=
r=3D"RTL" style=3D"font-size:20pt;line-height:115%;font-family:Arial,&quot;=
sans-serif&quot;;color:rgb(13,13,13)">=D8=A8=D8=A7=D9=84=D8=AA=D8=B9=D8=A7=
=D9=88=D9=86 =D9=85=D8=B9</span></b></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;backgrou=
nd-image:initial;background-position:initial;background-size:initial;backgr=
ound-repeat:initial;background-origin:initial;background-clip:initial;direc=
tion:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"AR-EG" di=
r=3D"RTL" style=3D"font-size:20pt;line-height:115%;font-family:Arial,&quot;=
sans-serif&quot;;color:rgb(0,112,192)">1- =D9=88=D8=B2=D8=A7=D8=B1=D8=A9 =
=D8=A7=D9=84=D8=AA=D8=B1=D8=A8=D9=8A=D8=A9
=D9=88=D8=A7=D9=84=D8=AA=D8=B9=D9=84=D9=8A=D9=85</span></b><b><span style=
=3D"font-size:20pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot=
;;color:rgb(0,112,192)"></span></b></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;backgrou=
nd-image:initial;background-position:initial;background-size:initial;backgr=
ound-repeat:initial;background-origin:initial;background-clip:initial;direc=
tion:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><span dir=3D"RTL"></span><=
span dir=3D"RTL"></span><b><span lang=3D"AR-EG" dir=3D"RTL" style=3D"font-s=
ize:20pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot;;color:rg=
b(0,112,192)"><span dir=3D"RTL"></span><span dir=3D"RTL"></span>2_=D9=85=D8=
=B1=D9=83=D8=B2 =D8=A7=D9=84=D9=82=D8=A7=D9=87=D8=B1=D8=A9 =D9=84=D8=AA=D9=
=86=D9=85=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D9=88=D8=A7=D8=B1=D8=AF =D8=A7=D9=
=84=D8=A8=D8=B4=D8=B1=D9=8A=D8=A9</span></b></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;backgrou=
nd-image:initial;background-position:initial;background-size:initial;backgr=
ound-repeat:initial;background-origin:initial;background-clip:initial;direc=
tion:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"AR-EG" di=
r=3D"RTL" style=3D"font-size:20pt;line-height:115%;font-family:Arial,&quot;=
sans-serif&quot;;color:rgb(0,112,192)">3_ =D9=85=D8=AD=D8=A7=D9=81=D8=B8=D8=
=A9 =D8=A7=D9=84=D9=82=D8=A7=D9=87=D8=B1=D8=A9</span></b></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;backgrou=
nd-image:initial;background-position:initial;background-size:initial;backgr=
ound-repeat:initial;background-origin:initial;background-clip:initial;direc=
tion:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"AR-EG" di=
r=3D"RTL" style=3D"font-size:20pt;line-height:115%;font-family:Arial,&quot;=
sans-serif&quot;;color:rgb(0,112,192)">4=E2=80=93 =D8=A7=D9=84=D9=85=D8=B9=
=D9=87=D8=AF =D8=A7=D9=84=D9=82=D9=88=D9=85=D9=8A =D9=84=D9=84=D8=AC=D9=88=
=D8=AF=D8=A9</span></b></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;backgrou=
nd-image:initial;background-position:initial;background-size:initial;backgr=
ound-repeat:initial;background-origin:initial;background-clip:initial;direc=
tion:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:=
11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"AR-EG" di=
r=3D"RTL" style=3D"font-size:20pt;line-height:115%;font-family:Arial,&quot;=
sans-serif&quot;;color:rgb(0,112,192)">5- =D9=88=D8=B2=D8=A7=D8=B1=D8=A9 =
=D8=A7=D9=84=D8=AA=D8=AC=D8=A7=D8=B1=D8=A9
=D9=88=D8=A7=D9=84=D8=B5=D9=86=D8=A7=D8=B9=D8=A9</span></b><b><span style=
=3D"font-size:20pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot=
;;color:rgb(0,112,192)"></span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span dir=3D"RTL"=
></span><span dir=3D"RTL"></span><b><span lang=3D"AR-EG" style=3D"font-size=
:20pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot;;color:rgb(0=
,112,192)"><span dir=3D"RTL"></span><span dir=3D"RTL"></span>6-
=D8=A8=D8=AA=D8=B5=D8=AF=D9=8A=D9=82 =D9=85=D9=86 =D9=88=D8=B2=D8=A7=D8=B1=
=D8=A9 =D8=A7=D9=84=D8=AE=D8=A7=D8=B1=D8=AC=D9=8A=D8=A9</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"=
AR-EG" style=3D"font-size:26pt;line-height:115%;font-family:Arial,&quot;san=
s-serif&quot;;color:red">=C2=A0</span></b><b><span lang=3D"AR-SA" style=3D"=
font-size:26pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot;;co=
lor:red">=D8=A3=D9=82=D9=88=D9=89 =D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=81=D9=
=8A =D8=A7=D9=84=D8=AA=D8=B3=D9=88=D9=8A=D9=82 =D8=B9=D8=A8=D8=B1=D8=A7=D9=
=84=D8=A7=D9=86=D8=AA=D8=B1=D9=86=D8=AA</span></b><b><span lang=3D"AR-SA" s=
tyle=3D"font-size:26pt;line-height:115%;font-family:Arial,&quot;sans-serif&=
quot;;color:red"></span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"=
AR-EG" style=3D"font-size:20pt;line-height:115%;font-family:&quot;Simplifie=
d Arabic&quot;,&quot;serif&quot;;color:black">=D9=85=D9=86 31 =D9=8A=D9=88=
=D9=84=D9=8A=D9=88 =E2=80=93
4 =D8=A7=D8=BA=D8=B3=D8=B7=D8=B3 2022</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"=
AR-SA" style=3D"font-size:16pt;line-height:115%;font-family:Arial,&quot;san=
s-serif&quot;;color:black">=D8=AD=D8=B6=D9=88=D8=B1 =D8=A7=D9=81=D8=AA=D8=
=B1=D8=A7=D8=B6=D9=8A =D8=B9=D8=A8=D8=B1 =D9=85=D9=86=D8=B5=D8=A9 =D8=B2=D9=
=88=D9=88=D9=88=D9=85 =D9=81=D9=89 =D8=AD=D8=A7=D9=84
=D8=AA=D8=B9=D8=AB=D8=B1 =D8=A7=D9=84=D8=AD=D8=B6=D9=88=D8=B1</span></b></p=
>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"=
AR-SA" style=3D"font-size:16pt;line-height:115%;font-family:Arial,&quot;san=
s-serif&quot;;color:black">=C2=A0</span></b></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"text-align:justify;margin:0in 0=
in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;font-size:11pt;fo=
nt-family:Calibri,&quot;sans-serif&quot;"><b><u><span lang=3D"AR-SA" style=
=3D"font-size:14pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot=
;;color:red">=D8=AA=D9=81=D8=A7=D8=B5=D9=8A=D9=84 =D9=88=D9=85=D8=AD=D8=A7=
=D9=88=D8=B1 =D8=A7=D9=84=D8=AF=D8=A8=D9=84=D9=88=D9=85 =D8=A7=D9=84=D8=AA=
=D8=AF=D8=B1=D9=8A=D8=A8=D9=8A</span></u></b></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"text-align:justify;margin:0in 0=
in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;font-size:11pt;fo=
nt-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"AR-SA" style=3D"=
font-size:12pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot;">=
=D8=A8=D8=B1=D9=86=D8=A7=D9=85=D8=AC =D8=AA=D8=AF=D8=B1=D9=8A=D8=A8=D9=8A =
=D8=AA=D9=85 =D8=AA=D8=B5=D9=85=D9=8A=D9=85=D9=87 =D8=AE=D8=B5=D9=8A=D8=B5=
=D8=A7 =D9=84=D9=84=D8=B1=D8=A7=D8=BA=D8=A8=D9=8A=D9=86
=D8=A8=D8=A7=D9=84=D8=B9=D9=85=D9=84 =D9=81=D9=8A =D9=85=D8=AC=D8=A7=D9=84 =
=D8=A7=D9=84=D8=AA=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=D9=84=D8=A7=D9=84=D9=83=
=D8=AA=D8=B1=D9=88=D9=86=D9=8A =D8=AD=D9=8A=D8=AB =D9=8A=D8=BA=D8=B7=D9=8A =
=D8=AC=D9=85=D9=8A=D8=B9 =D8=AC=D9=88=D8=A7=D9=86=D8=A8 =D8=A7=D9=84=D8=AA=
=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=D9=84=D8=A7=D9=84=D9=83=D8=AA=D8=B1=D9=88=
=D9=86=D9=8A=D8=8C =D9=88=D9=82=D8=AF =D8=AA=D9=85
=D8=AA=D8=B5=D9=85=D9=8A=D9=85 =D8=AA=D9=84=D9=83 =D8=A7=D9=84=D8=AF=D9=88=
=D8=B1=D8=A9 =D8=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=D8=A8=D9=8A=D8=A9 =D9=84=
=D8=AA=D9=86=D8=A7=D8=B3=D8=A8 =D8=AC=D9=85=D9=8A=D8=B9 =D8=A7=D9=84=D9=85=
=D8=B3=D8=AA=D9=88=D9=8A=D8=A7=D8=AA=D8=8C =D9=85=D9=86 =D8=A7=D9=84=D9=85=
=D8=A8=D8=AA=D8=AF=D8=A6=D9=8A=D9=86 =D9=88=D8=AD=D8=AA=D9=89 =D8=A7=D9=84=
=D9=85=D8=AD=D8=AA=D8=B1=D9=81=D9=8A=D9=86=D8=8C =D9=84=D8=A3=D9=86
=D8=A7=D9=84=D8=AF=D9=88=D8=B1=D8=A9 =D8=AA=D8=BA=D8=B7=D9=8A =D8=A7=D9=87=
=D9=85 =D8=A7=D9=84=D9=85=D8=AD=D8=A7=D9=88=D8=B1 =D8=A7=D9=84=D9=85=D8=B1=
=D8=AA=D8=A8=D8=B7=D8=A9 =D8=A8=D9=85=D8=AC=D8=A7=D9=84 =D8=A7=D9=84=D8=AA=
=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=D9=84=D8=A7=D9=84=D9=83=D8=AA=D8=B1=D9=88=
=D9=86=D9=8A=D8=8C =D9=88=D8=A7=D8=B4=D9=87=D8=A7=D8=B1 =D9=85=D9=88=D8=A7=
=D9=82=D8=B9 =D8=A7=D9=84=D8=A7=D9=86=D8=AA=D8=B1=D9=86=D8=AA=D8=8C
=D9=88=D8=A7=D9=84=D9=82=D8=A7=D8=A1 =D8=A7=D9=84=D8=B6=D9=88=D8=A1 =D8=B9=
=D9=84=D9=89 =D8=A7=D8=B3=D8=AA=D8=B1=D8=A7=D8=AA=D9=8A=D8=AC=D9=8A=D8=A7=
=D8=AA =D8=A7=D9=84=D8=AA=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=D9=84=D8=A7=D9=84=
=D9=83=D8=AA=D8=B1=D9=88=D9=86=D9=8A=D8=8C =D8=A8=D9=85=D8=A7 =D9=8A=D8=B6=
=D9=85=D9=86 =D9=84=D9=84=D9=85=D8=B4=D8=A7=D8=B1=D9=83=D9=8A=D9=86 =D9=81=
=D9=8A =D9=87=D8=B0=D9=87 =D8=A7=D9=84=D8=AF=D9=88=D8=B1=D8=A9
=D8=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=D8=A8=D9=8A=D8=A9 =D8=A7=D9=84=D9=88=
=D8=B5=D9=88=D9=84 =D8=A7=D9=84=D9=89 =D9=85=D8=B3=D8=AA=D9=88=D9=89 =D8=A7=
=D9=84=D9=85=D8=AD=D8=AA=D8=B1=D9=81=D9=8A=D9=86 =D9=81=D9=8A =D8=A7=D9=84=
=D8=AA=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=D9=84=D8=A7=D9=84=D9=83=D8=AA=D8=B1=
=D9=88=D9=86=D9=8A=D8=8C =D8=A8=D9=85=D8=B4=D8=A7=D8=B1=D9=83=D8=AA=D9=83 =
=D9=81=D9=8A =D9=87=D8=B0=D9=87 =D8=A7=D9=84=D8=AF=D9=88=D8=B1=D8=A9=D8=8C
=D9=81=D8=A3=D9=86=D8=AA =D8=AA=D8=AF=D8=AE=D9=84 =D9=87=D8=B0=D8=A7 =D8=A7=
=D9=84=D9=85=D8=AC=D8=A7=D9=84 =D9=88=D8=AA=D8=B5=D8=A8=D8=AD =D9=88=D8=A7=
=D8=AD=D8=AF=D8=A7 =D9=85=D9=86 =D8=A7=D9=84=D9=85=D8=AD=D8=AA=D8=B1=D9=81=
=D9=8A=D9=86 =D9=81=D9=8A =D8=A7=D9=84=D8=AA=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=
=D9=84=D8=A7=D9=84=D9=83=D8=AA=D8=B1=D9=88=D9=86=D9=8A=D8=8C =D8=AA=D8=AA=
=D9=85 =D8=A7=D9=84=D8=AF=D8=B1=D8=A7=D8=B3=D8=A9
=D9=81=D9=8A =D9=87=D8=B0=D9=87 =D8=A7=D9=84=D8=AF=D9=88=D8=B1=D8=A9 =D8=A7=
=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=D8=A8=D9=8A=D8=A9 =D8=A7=D9=88=D9=86 =D9=84=
=D8=A7=D9=8A=D9=86 =D8=B9=D8=A8=D8=B1 =D8=A7=D9=84=D8=A7=D9=86=D8=AA=D8=B1=
=D9=86=D8=AA =D8=A8=D9=86=D8=B8=D8=A7=D9=85 =D8=A7=D9=84=D8=AA=D8=AF=D8=B1=
=D9=8A=D8=A8 =D8=B9=D9=86 =D8=A8=D8=B9=D8=AF.</span></b><b><span lang=3D"AR=
-SA" style=3D"font-size:12pt;line-height:115%;font-family:Arial,&quot;sans-=
serif&quot;"></span></b></p>

<p class=3D"MsoNormal" dir=3D"RTL" style=3D"margin:0in 0in 10pt;line-height=
:115%;direction:rtl;unicode-bidi:embed;font-size:11pt;font-family:Calibri,&=
quot;sans-serif&quot;"><b><u><span lang=3D"AR-SA" style=3D"font-size:14pt;l=
ine-height:115%;font-family:Arial,&quot;sans-serif&quot;;color:red">=D8=A7=
=D9=84=D8=A3=D9=87=D8=AF=D8=A7=D9=81 =D8=A7=D9=84=D8=AA=D8=AF=D8=B1=D9=8A=
=D8=A8=D9=8A=D8=A9</span></u></b></p>

<p class=3D"gmail-MsoListParagraphCxSpFirst" dir=3D"RTL" style=3D"margin:0i=
n 0.5in 0.0001pt 0in;line-height:115%;direction:rtl;unicode-bidi:embed;font=
-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span style=3D"fo=
nt-size:12pt;line-height:115%;font-family:Symbol">=C2=B7<span style=3D"font=
-variant-numeric:normal;font-variant-east-asian:normal;font-weight:normal;f=
ont-stretch:normal;font-size:7pt;line-height:normal;font-family:&quot;Times=
 New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></b><span dir=3D"RTL"></span><b><span lang=3D"AR-SA" style=3D=
"font-size:12pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot;">=
=D9=85=D8=B9=D8=B1=D9=81=D8=A9 =D8=B7=D8=B1=D9=82 =D9=88=D8=A3=D8=AF=D9=88=
=D8=A7=D8=AA =D9=88=D8=A7=D8=B3=D8=AA=D8=B1=D8=A7=D8=AA=D9=8A=D8=AC=D9=8A=
=D8=A7=D8=AA =D8=A7=D9=84=D8=AA=D8=B3=D9=88=D9=8A=D9=82
=D8=A7=D9=84=D8=A5=D9=84=D9=83=D8=AA=D8=B1=D9=88=D9=86=D9=8A =D9=88=D9=83=
=D9=8A=D9=81=D9=8A=D8=A9 =D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85=D9=87=
=D8=A7 =D9=81=D9=8A =D8=AA=D8=B3=D9=88=D9=8A=D9=82 =D8=A7=D9=84=D8=B3=D9=84=
=D8=B9 =D9=88=D8=A7=D9=84=D8=AE=D8=AF=D9=85=D8=A7=D8=AA .</span></b></p>

<p class=3D"gmail-MsoListParagraphCxSpMiddle" dir=3D"RTL" style=3D"margin:0=
in 0.5in 0.0001pt 0in;line-height:115%;direction:rtl;unicode-bidi:embed;fon=
t-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span style=3D"f=
ont-size:12pt;line-height:115%;font-family:Symbol">=C2=B7<span style=3D"fon=
t-variant-numeric:normal;font-variant-east-asian:normal;font-weight:normal;=
font-stretch:normal;font-size:7pt;line-height:normal;font-family:&quot;Time=
s New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span></b><span dir=3D"RTL"></span><b><span lang=3D"AR-SA" style=3D=
"font-size:12pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot;">=
=D8=B9=D9=85=D9=84 =D8=AE=D8=B7=D8=A9 =D8=AA=D8=B3=D9=88=D9=8A=D9=82=D9=8A=
=D8=A9 =D8=AA=D8=AA=D9=86=D8=A7=D8=B3=D8=A8 =D9=85=D8=B9 =D8=A7=D9=84=D9=85=
=D9=86=D8=AA=D8=AC=D8=A7=D8=AA =D9=88=D8=A7=D9=84=D8=AE=D8=AF=D9=85=D8=A7=
=D8=AA
=D8=A7=D9=84=D8=AA=D9=8A =D8=AA=D9=82=D8=AF=D9=85=D9=87=D8=A7 =D9=84=D8=B9=
=D9=85=D9=84=D8=A7=D8=A6=D9=83.</span></b></p>

<p class=3D"gmail-MsoListParagraphCxSpLast" dir=3D"RTL" style=3D"margin:0in=
 0.5in 10pt 0in;line-height:115%;direction:rtl;unicode-bidi:embed;font-size=
:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span style=3D"font-si=
ze:26pt;line-height:115%;font-family:Symbol">=C2=B7<span style=3D"font-vari=
ant-numeric:normal;font-variant-east-asian:normal;font-weight:normal;font-s=
tretch:normal;font-size:7pt;line-height:normal;font-family:&quot;Times New =
Roman&quot;">=C2=A0=C2=A0=C2=A0 </span></span></b><span dir=3D"RTL"></span>=
<b><span lang=3D"AR-SA" style=3D"font-size:12pt;line-height:115%;font-famil=
y:Arial,&quot;sans-serif&quot;">=D8=A7=D9=84=D8=AA=D8=B9=D8=B1=D9=81
=D8=B9=D9=84=D9=8A =D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=AD=D9=84 =D8=A7=D9=84=
=D9=85=D8=B4=D8=A7=D9=83=D9=84 =D8=A7=D9=84=D8=AA=D9=8A =D8=AA=D8=B9=D8=AA=
=D8=B1=D8=B6 =D8=B9=D9=85=D9=84=D9=8A=D8=A9 =D8=A7=D9=84=D8=AA=D8=B3=D9=88=
=D9=8A=D9=82 =D9=88=D9=83=D9=8A=D9=81=D9=8A=D8=A9 =D8=A5=D9=8A=D8=AC=D8=A7=
=D8=AF =D8=A7=D9=84=D8=A8=D8=AF=D8=A7=D8=A6=D9=84 .</span></b><b><span dir=
=3D"LTR" style=3D"font-size:26pt;line-height:115%"></span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.2=
5in 10pt 0in;text-align:center;background-image:initial;background-position=
:initial;background-size:initial;background-repeat:initial;background-origi=
n:initial;background-clip:initial;line-height:115%;direction:rtl;unicode-bi=
di:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><spa=
n lang=3D"AR-JO" style=3D"font-size:22pt;line-height:115%;font-family:Arial=
,&quot;sans-serif&quot;;color:rgb(192,0,0)">=D9=84=D8=AA=D8=A3=D9=83=D9=8A=
=D8=AF =D9=85=D8=B4=D8=A7=D8=B1=D9=83=D8=AA=D9=83=D9=85 </span></b><b><span=
 lang=3D"AR-EG" style=3D"font-size:22pt;line-height:115%;font-family:Arial,=
&quot;sans-serif&quot;;color:rgb(192,0,0)">=D8=A7=D9=84=D8=B4=D9=87=D8=A7=
=D8=AF=D8=A9</span></b><b><span lang=3D"AR-JO" style=3D"font-size:22pt;line=
-height:115%;font-family:Arial,&quot;sans-serif&quot;;color:rgb(192,0,0)">
=D8=A7=D9=84=D9=85=D8=B0=D9=83=D9=88=D8=B1=D8=A9 =D8=A7=D8=B9=D9=84=D8=A7=
=D9=87 =D9=8A=D8=B1=D8=AC=D9=89 =D8=A7=D9=84=D8=AA=D9=88=D8=A7=D8=B5=D9=84 =
=D9=85=D8=B9 =D8=A3/ =D8=B3=D8=A7=D8=B1=D8=A9 =D8=B9=D8=A8=D8=AF =D8=A7=D9=
=84=D8=AC=D9=88=D8=A7=D8=AF =E2=80=93 =D8=AC=D9=88=D8=A7=D9=84 &amp; =D9=88=
=D8=A7=D8=AA=D8=B3 =D8=A7=D8=A8
00201062992510 - 00201096841626</span></b><span lang=3D"AR-SA" style=3D"fon=
t-size:20pt;line-height:115%;font-family:Arial,&quot;sans-serif&quot;"></sp=
an></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><b><span lang=3D"=
AR-SA" style=3D"font-size:20pt;line-height:115%;font-family:&quot;Simplifie=
d Arabic&quot;,&quot;serif&quot;;color:black">=C2=A0</span></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><u><span lang=3D"=
AR-EG" style=3D"font-size:48pt;line-height:115%;font-family:Arial,&quot;san=
s-serif&quot;;color:red">=D9=8A=D8=B9=D9=82=D8=AF =D9=81=D9=8A =D9=86=D9=81=
=D8=B3 =D8=A7=D9=84=D8=AA=D8=A7=D8=B1=D9=8A=D8=AE :-</span></u></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">1.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=AC=D9=88=D8=AF=D8=A9 =D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=
=3D"LTR" style=3D"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">2.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=AA=D9=88=D9=83=D9=8A=D8=AF =D8=A7=D9=84=D8=AC=D9=88=D8=AF=D8=A9 =D8=
=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D"fo=
nt-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">3.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D9=85=D8=B1=D8=A7=D9=82=D8=A8=D8=A9 =D8=A7=D9=84=D8=AC=D9=88=D8=AF=D8=
=A9 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" styl=
e=3D"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">4.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=D9=85=D8=AE=D8=A7=D8=B7=D8=
=B1 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" styl=
e=3D"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">5.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=A7=D9=84=D8=A8=D9=8A=D8=A6=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D8=B9=D8=
=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D"font-size:20pt"></span></p=
>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">6.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=A7=D9=84=D8=B3=D9=84=D8=A7=D9=85=D8=A9 =D9=88=D8=A7=D9=84=D8=B5=D8=
=AD=D8=A9 =D8=A7=D9=84=D9=85=D9=87=D9=86=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D8=
=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D"font-size:20pt"></sp=
an></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">7.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=B3=D9=84=D8=A7=D9=85=D8=A9 =D8=A7=D9=84=D8=BA=D8=B0=D8=A7=D8=A1 =D8=
=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D"fo=
nt-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">8.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=A7=D9=84=D9=85=D8=AE=D8=AA=D8=A8=D8=B1=D8=A7=D8=AA =D8=A7=D9=84=D9=
=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D"font-size:20pt=
"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">9.<span style=3D"font-variant-numeric:normal;font=
-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:no=
rmal;font-family:&quot;Times New Roman&quot;"> </span></span><span dir=3D"R=
TL"></span><span lang=3D"AR-SA" style=3D"font-size:20pt;font-family:Arial,&=
quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=D8=A9 =D9=85=D8=AF=D9=8A=D8=
=B1 =D8=A3=D9=85=D9=86 =D8=A7=D9=84=D9=85=D8=B9=D9=84=D9=88=D9=85=D8=A7=D8=
=AA</span><span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LT=
R" style=3D"font-size:20pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></sp=
an> ISO 27001</span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">10.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=AA=D9=83=D9=86=D9=88=D9=84=D9=88=D8=AC=
=D9=8A=D8=A7 =D8=A7=D9=84=D9=85=D8=B9=D9=84=D9=88=D9=85=D8=A7=D8=AA</span><=
span dir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D=
"font-size:20pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> ISO / I=
EC 20000</span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">11.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=AA=D9=82=D9=8A=D9=8A=D9=85 =D8=A7=D9=84=
=D9=85=D8=B7=D8=A7=D8=A8=D9=82=D8=A9 =D9=84=D8=B4=D8=B1=D9=83=D8=A7=D8=AA =
=D8=A7=D9=84=D8=AA=D9=81=D8=AA=D9=8A=D8=B4</span><span dir=3D"LTR"></span><=
span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-size:20pt"><span di=
r=3D"LTR"></span><span dir=3D"LTR"></span> ISO / IEC 17020</span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">12.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=B9=D9=84=D8=A7=D9=85=D8=A9 =D8=A7=D9=84=
=D9=85=D8=B7=D8=A7=D8=A8=D9=82=D8=A9 =D8=A7=D9=84=D8=A3=D9=88=D8=B1=D9=88=
=D8=A8=D9=8A=D8=A9 =D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span d=
ir=3D"LTR"></span><span dir=3D"LTR"></span><span dir=3D"LTR" style=3D"font-=
size:20pt"><span dir=3D"LTR"></span><span dir=3D"LTR"></span> CE Mark</span=
></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">13.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=A7=D9=84=D8=AA=D8=AE=D8=B7=D9=8A=D8=B7 =
=D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D=
"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">14.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=A5=D8=AF=D8=A7=D8=B1=D8=A9 =D8=A7=D9=84=
=D9=85=D9=88=D8=A7=D8=B1=D8=AF =D8=A7=D9=84=D8=A8=D8=B4=D8=B1=D9=8A=D8=A9 =
=D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D=
"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">15.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=A7=D9=84=D8=B5=D9=8A=D8=A7=D9=86=D8=A9 =
=D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D=
"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">16.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=A7=D9=84=D8=A7=D9=86=D8=AA=D8=A7=D8=AC =
=D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D=
"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">17.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=A7=D9=84=D9=85=D8=AE=D8=A7=D8=B2=D9=86 =
=D9=88=D8=A7=D9=84=D9=85=D8=B3=D8=AA=D9=88=D8=AF=D8=B9=D8=A7=D8=AA =D8=A7=
=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D"font-=
size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"margin:0in 0.5=
in 0.0001pt 0in;text-align:center;line-height:normal;direction:rtl;unicode-=
bidi:embed;font-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span=
 style=3D"font-size:20pt">18.<span style=3D"font-variant-numeric:normal;fon=
t-variant-east-asian:normal;font-stretch:normal;font-size:7pt;line-height:n=
ormal;font-family:&quot;Times New Roman&quot;">=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
</span></span><span dir=3D"RTL"></span><span lang=3D"AR-SA" style=3D"font-s=
ize:20pt;font-family:Arial,&quot;sans-serif&quot;">=D8=B4=D9=87=D8=A7=D8=AF=
=D8=A9 =D9=85=D8=AF=D9=8A=D8=B1 =D8=A7=D9=84=D8=AA=D8=B3=D9=88=D9=8A=D9=82 =
=D8=A7=D9=84=D9=85=D8=B9=D8=AA=D9=85=D8=AF</span><span dir=3D"LTR" style=3D=
"font-size:20pt"></span></p>

<p class=3D"MsoNormal" align=3D"center" style=3D"text-align:center;directio=
n:ltr;unicode-bidi:embed;margin:0in 0in 10pt;line-height:115%;font-size:11p=
t;font-family:Calibri,&quot;sans-serif&quot;"><b><u><span style=3D"font-siz=
e:24pt;line-height:115%;color:red"><span style=3D"text-decoration-line:none=
">=C2=A0</span></span></u></b></p>

<p class=3D"MsoNormal" align=3D"center" dir=3D"RTL" style=3D"text-align:cen=
ter;margin:0in 0in 10pt;line-height:115%;direction:rtl;unicode-bidi:embed;f=
ont-size:11pt;font-family:Calibri,&quot;sans-serif&quot;"><span dir=3D"LTR"=
 style=3D"font-size:22pt;line-height:115%">=C2=A0</span></p></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAAMCtORUOVaJvLuPUzZk0fQPBFAyTFpC5KMzs5EoLxj_z%2BB=
qAQ%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAAMCtORUOVaJvLuPUzZk0fQPBFAyTFpC5KMzs5Eo=
Lxj_z%2BBqAQ%40mail.gmail.com</a>.<br />

--0000000000005575f105e4b4354e--
