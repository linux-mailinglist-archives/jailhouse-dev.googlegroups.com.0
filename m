Return-Path: <jailhouse-dev+bncBCOKB247TIDBBAEU7P2AKGQEZKS7FSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CCF1B23AF
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:25:04 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id bz19sf8561943ejc.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:25:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587464704; cv=pass;
        d=google.com; s=arc-20160816;
        b=i1nfAUIzoIvSD98ZjKWK/3t0p/w/X2TPt9oe/iDXMza9OziUW4ayzChC3Cl9fub7CM
         hO+yyUdHLK7ECfWKy/MODjksMckNnCrMDB+7Qkb7aa3NletT2QqMOQeq96qdyFnTqn4N
         +kDqyVJuNh64/sW8uUUi6pnXfKAZQU2Yp6x5H8KN//QjbcgMeloayOl8mwMgf5o3jY1g
         eEJ9UBsXxneVJWsV/IMkEvnW7oef5zwc787hvpMiD45BuVG08bRRxWs780JPV2VadaQ7
         CaYnYp/uXqm7+QV+PSQTeljdAxPrgCwwuJD9FI2zqeTuC9yKWjDcRCMbhZcFWMnHgOHP
         lRIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=QXlF6vXu83J3HzQiRfbj7fpvwbhLk2SFVtS7inUCUxs=;
        b=1Femb7vvj6o9vhXsGtMIQ7uiXiCWdQ6nD8A8HFkAtZ5na64ecXMP7fFBMfeXP2v9oo
         V7LFqxeX2hdjuqDDQA1PKZ6+TECnvyRFUfSm1fAa2sSRMCeGlFE4b1pRx7perWhg4IgN
         /AcFGklIVaYYLffSZn5WRvyz250A1N/tAvH77ihafcn9Vr5NXcxCN4WseBGybNMmKg1r
         w5l2sOW4BYSEtwobgol4sAIb9pN8IlPQr6TRfj+sthFtfT7gAdoqG6GgpjabBe2z8ccD
         tX7rb8qmrz4MhDtGVsD/jgYwS9v/AU8AKAn4eSthQqbgI/IDKmWivgXyAMeoz9fg2AVv
         aJEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=CSmK7jaw;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::342 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=QXlF6vXu83J3HzQiRfbj7fpvwbhLk2SFVtS7inUCUxs=;
        b=XmMDmnronQc8kmg2Jul9gId5c7yuf5bJfl4HN8scYhjao4j8hduC01ZfwSP55niPrG
         q/f9yL+M6jiu5xAOte5NnOzDbUpkZD08qEJ0Hw6JNjCRyFfsU+vv59CkJlYDvFocVAB0
         t1eytBJTO+c5YDPccF2VhbNhs0uYRTYziQDQlcqtVFXdfz8nFW3x8kq9F970yOaWqTVe
         RZx0W2Mb1A5GBR7nKKfpds0+s9zOkEU0x6fMmuk4TVlHpHh6CcyD6IM/n8V7PJ2Y7ykm
         EIKwh4cttpP6vj+s9F+6XsUXfjdAqhYiI1XAAWuXRyIMSHy/0qe1O8hP9mdUK131Webs
         99vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QXlF6vXu83J3HzQiRfbj7fpvwbhLk2SFVtS7inUCUxs=;
        b=R7CCMXOCdmm0Q3iOdpI6OijHt6hBbJhPusZMhSRihMcZlLz18aWIsZmSkmxYghInEs
         h2H7y+/FIvO6KvuvG5pkWJdvroSUvxQeqzJWolzUIP3JSnh3sm4TzzPalXsPXOge+KAb
         BmWXsi0/Pbqy/J8sTpmBLXZmGrCmucr8Z5W2rvCvL8GdCvtIu6QDaqV0THjSpZIrpU8f
         44Xe3zNKxU2sJpjsl6VklvAOSrEKFY2AAegjnwjB2LLSav5ys8qlSdQdCZWHSDp7enlH
         MqnawTcu1KNPMmeFCf7i80bXgILaHRx8XwVvD73JygsCCJY8v+fRj2P5IBXvVL1W1DTF
         tiEQ==
X-Gm-Message-State: AGi0Pub6KcBYA9rUIWdLHeu9KAui/g4BWXcvLTAekWxUZixRx+RV+gti
	asFU5YD/Ri7lk70TbtbJy44=
X-Google-Smtp-Source: APiQypIg+7H/M0BUbJiSSHYyIJMcFRXZkKH1MCnLV5eiGMDoIWW0lNxpYnU4E1fmXTnE5DlWSDP5/Q==
X-Received: by 2002:a05:6402:b4e:: with SMTP id bx14mr8606955edb.41.1587464704343;
        Tue, 21 Apr 2020 03:25:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1a58:: with SMTP id bf24ls2113030edb.2.gmail; Tue,
 21 Apr 2020 03:25:03 -0700 (PDT)
X-Received: by 2002:a50:de44:: with SMTP id a4mr18587880edl.56.1587464703582;
        Tue, 21 Apr 2020 03:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587464703; cv=none;
        d=google.com; s=arc-20160816;
        b=BuhIqn0/6Lv3tJszZWef2rFKlZPor0Qyj5iiIlMcGP3iO8VPSZ0sOmhjnWUCNwhG9U
         QCdhpqheiiTPqnrt4tE1faonCulTfb0raBH9prtH503vAsG8AAwOBqJzuZySyWiHOK9Q
         Zpr/b2UT9bHt3ITr5K1bUwoWCZ3WIqj9gDtIJ9pxyh67Nt6A5iloJsH5vseLGQlUl4Mv
         +QUDnCU1V9N4UF8HCjdagUQ4vybb662i1JaR2ccq/e4b84hCTAQczntxfH3AAOEfRZuW
         lRQEx7A6kUIvCgRfsv0mDfcx/nQh/lRt3/WShEfUGVamqqofXlzc3gNR91Ek00Xf/RmE
         MpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=j68DzKApYiFyKecOdClEcKp1HvjiyLi63pNjcZv4szg=;
        b=yeRk7/T6eo3UgjDJKvkc/EF+kyTOM5OCIA2AaN6sPFUjkExP84S7C1WOFMUoRJu1U0
         3xj9+pRBrHZBJpBwW6oWNiWOsAcgvpoNV+DTt/FVbgq0Bmq2zRvD1B1464iYO+6O9L6L
         YqJkNXHTR435B+qkaHYaQcEaZkKqlDIM9bw52AfzLy5boKsftV0NI8NAvbwSjAm/doo7
         0Jue9kTRQs8cplbgXg+l+PTZ8ai8nHqu2yz/vDNDg8wsaM1e9dTQBCPH7Nv2fanxnBu0
         L4v+yJgLFyhOyQN6RPT2PDs5FaJKwKWijLhwJ5DjKy96EC4bTHYm1sOy1qzz8h/7jeBa
         wIWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@unimore.it header.s=google header.b=CSmK7jaw;
       spf=pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::342 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com. [2a00:1450:4864:20::342])
        by gmr-mx.google.com with ESMTPS id v14si145284edr.4.2020.04.21.03.25.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 03:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of marco.solieri@unimore.it designates 2a00:1450:4864:20::342 as permitted sender) client-ip=2a00:1450:4864:20::342;
Received: by mail-wm1-x342.google.com with SMTP id r26so3074529wmh.0
        for <jailhouse-dev@googlegroups.com>; Tue, 21 Apr 2020 03:25:03 -0700 (PDT)
X-Received: by 2002:a1c:c345:: with SMTP id t66mr4417165wmf.189.1587464703044;
        Tue, 21 Apr 2020 03:25:03 -0700 (PDT)
Received: from localhost (217-133-116-244.static.clienti.tiscali.it. [217.133.116.244])
        by smtp.gmail.com with ESMTPSA id l4sm3287772wrw.25.2020.04.21.03.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 03:25:02 -0700 (PDT)
Date: Tue, 21 Apr 2020 12:24:04 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
Message-ID: <20200421102404.dzijb22qoue57pkc@carbon.xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u6siherfpzqcp37h"
Content-Disposition: inline
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
X-Original-Sender: marco.solieri@unimore.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@unimore.it header.s=google header.b=CSmK7jaw;       spf=pass
 (google.com: domain of marco.solieri@unimore.it designates
 2a00:1450:4864:20::342 as permitted sender) smtp.mailfrom=marco.solieri@unimore.it;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=unimore.it
X-Original-From: Marco Solieri <marco.solieri@unimore.it>
Reply-To: Marco Solieri <marco.solieri@unimore.it>
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


--u6siherfpzqcp37h
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2020 at 12:03:42PM +0200, Marco Solieri wrote:
> This series proposes major reviews to the cache coloring support
> proposed on 2019-03-27 on this list.

As a side note, this has been tested also on NXP i.MX8 QM, using
mainline Jailhouse by just disabling NXP-specific features (most
prominently, SMMU) from the root-cell configuration.

Regards.

--=20
Marco Solieri, Ph.D.
Research Fellow

High-Performance Real-Time Lab
Universit=C3=A0 degli Studi di Modena e Reggio Emilia
Ufficio 1.35 - Edificio Matematica - 213/b, via Campi - 41125 Modena
Tel: +39-059-205-55-10  -- OpenPGP: Ox75822E7E

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200421102404.dzijb22qoue57pkc%40carbon.xt3.it.

--u6siherfpzqcp37h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOC2XMK2o3tvc3F09Ctn83XWCLn4FAl6eycQACgkQCtn83XWC
Ln6ZZw/8CrVE7pj36OC018MUBjcByBmEBcTwhDhGZPhvkQyJLtoUBDn0PnNvlY0D
i+COuc42guuJ078yA7SZBqffzq5nFsfAZOsqvFPJ04WTgukD8RzmaH9h+pasEgkD
3MEP6bxN/T5BWcKCNDurzupL4ijnXa2danINirmxahqE2YBi9BH/qWD6Jf8LvRpe
rFYo/j+Hahy6+h6eAvWcrdTyBspIr12V1G/1XFhwTTLn82bRbvQBY5DEhQ8O07DH
56i1PIWz4X8d7/PmvzjyI0cfGSsIXeK3hU4VSWxMlSvwsPZnXTzc7HWjUE+ZVtNR
gh6jTsHT4XdUAHAVTbEjTRo6YL+dJ1uqEjHaVSaYEl7ooiBFoUGK8MUUd0TeqmUB
Ly8M2xuMvmAxUKujfAKZLmm0yFSCIBoRVDMqJAZ9CvSlsw/Cd6qtdamBZm+Az9VD
vICuxDmKW4nFXxk9vy5jyqADALOI2j51GxkPgkZXnGTHWgYaVqXBb7AmrkAzrJQS
A1mFDlkIpg3u8OyQdYrBVIl6hPNTpqn0VdyUCYJKEvOWkTRR+H3XtHGUjD1r9YK2
NnWRHJToHXzo627hdlw4Vvl70iHr949+/MU/8oyA9lXIi3l7xPl2u8xKBM/NJnJl
Dm6UhoDlIDMTBWAHKW7rFEJIVQROJ/UUYKt2KHMXHOS15X0Camc=
=m/cM
-----END PGP SIGNATURE-----

--u6siherfpzqcp37h--
