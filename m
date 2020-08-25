Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWWLSP5AKGQE2KNQBIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B96251687
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 12:20:10 +0200 (CEST)
Received: by mail-ej1-x63f.google.com with SMTP id e22sf5155551ejx.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 03:20:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598350810; cv=pass;
        d=google.com; s=arc-20160816;
        b=cPCnIBmqzMxxj7dZ/EMulZEvNOSopx7hOYZLV+LdP1dxLFViccg2q9vYIbwEewAIMP
         8/wGMxYCsTYKIVO+z8sed8Djwa5FjORcRq4xXHzXx/TCDy1JZ8pb1pwXJTvF642ENLRC
         NBoMCxhX9m1GvP3rSIIjpjdqiB7VssjFejYofnLFPwarioQhOJWfO7Y1rWy2mAOmMMRT
         CBxf/xbhPj8WQcNgsgpfRn0Q08fJ9fvlUiNdhUEpbEtXfOqMu4fWJJ0DhEv75v6G3WxV
         M27uCS9CZqrahPxBChiLN4yKh4+dfvre6H9zWNEFkcG/VXi/qMYiSCCcyykI+C9UB7kh
         QeuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=os82wf3iAyMTarMHXWieX8kJckOWbJM+r9gXuZkInMc=;
        b=CS/o47mVqetZogVQIdUkM+d07IVeIZ/SyntDEtB2IVaL/kM/3/ZqBw/9roig9LDgRC
         sUuTJ0CEgmRQhxxYVkZEfhjaBue87jUSHEqGYJkLOSo4wAFPlf2NcbYflu8kQl2hG54/
         9BzwIH0tD9Sd3UR3Ui8OLNaLS78W3vzXjK7gmBEPrl5KKSlDOapf1n7SQcPiq4IhsQws
         CxPLXxCYUGMt/qNlaCE1M7xxAMijAhSzZYjJS7nNQvsKwyoQ7lxSOQU/3/nqz7zf88zb
         WP/0nqJ37tDktK5oyMz/iGZ90cI+KGOiokr4lMAgpUY3k5tMK7HYkt3Z3c1U5/oqKjfr
         A+DA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=os82wf3iAyMTarMHXWieX8kJckOWbJM+r9gXuZkInMc=;
        b=I5LilIFmAR3Dw2XPMafxU+XwrvWa1p9MlmlZBYJWH11plrlBXRYzwygHWNQ5VVGii5
         ixpUxKowJHGaVWM6+0D/ZF9uQHPj/pmo5mYCUgos2pfTgFC6A7gf0oUSANf4xpOZ/F6O
         IIeLXfx0EUvYzwzIgzad2psTAoU1mKyqlOaus8PqD6Q82OW9d3Jo85q1/G7OOGXD1XqR
         LXFTwhSqW5xdZGMNL4eTYVQcl/ubByGsdHfYPQCAgzctPT3e1Xt1KT8osPcPbi6oeO2W
         xLhNqXYw9aEKCUNix6OfJlnqgGQOUeVxIdD5P109evvXtoqFoxmCHbHvVJMe+9xeJKM9
         lO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=os82wf3iAyMTarMHXWieX8kJckOWbJM+r9gXuZkInMc=;
        b=T/pR9Wtr0bXIgN0u/G88uPL5fXFO2efirki8w9bXPcY2xuucrwNbvEbjUL78wnFAtJ
         Wzi6MKPr5L3B7DGC5Scvjt2/zHy6oQceb/B72IKFUKtxt/WeXq93DMF2msiyy06xESfM
         Xkpj1dyJPESCn9vkLhQ/DZ6AsJ6pliMdjCf4tg/j8DRoPIkYJOY5OFUsOG+Sce71xDxK
         FUv3oiiKh7ixN3m5+a6hynmPO+Fs1lht4u9vNXOgfqEdp82hf/OpuFjFo+7fgdezOdjW
         p8H8RXo+zff105XXfT3uLYhFD9W/XI9zfBHe9gCSt/ULu/g5aoZZw0wU1xRFnen1gNK7
         NmHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533bst9JFPGwDJ00nE0gNCNGjoXnepH6KVJZjMpIz9tefottzoog
	5FDYsr+3jxnWow2P3elEoTc=
X-Google-Smtp-Source: ABdhPJyU/Kvu9ocqcrqmUNWaPWQLOlIOgD2VPuMJ6dLIcPqrZV6Cqoeo7z7Z4wTd284X04jiMyWN2w==
X-Received: by 2002:aa7:c251:: with SMTP id y17mr9742248edo.13.1598350810480;
        Tue, 25 Aug 2020 03:20:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ea83:: with SMTP id d3ls417920edo.2.gmail; Tue, 25 Aug
 2020 03:20:09 -0700 (PDT)
X-Received: by 2002:aa7:c88f:: with SMTP id p15mr9529688eds.33.1598350809510;
        Tue, 25 Aug 2020 03:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598350809; cv=none;
        d=google.com; s=arc-20160816;
        b=wLcUGywRkqpV1oAS0KEgssyH06D5hcSCDEWg2YEl5BL+ilsdUEQewO6Oeim0T19cir
         Yey4v9kAbjIAg2fGoW+tLV10hrH8iMSXkdPRQkbODxivFV19kjC2AG7VWc40LAoEW03k
         1B3QBKDk3FmGta2zG0yIshGgneRh5Z4KeltRofMUjfbdf/IahSuoEQxCNx+qxTDPqub3
         sfuLASt/7D23ifKmnKD94qhRnMel0MKif+lFoJazca2onfl+IcZpT7iU5jHVjiPrXyZX
         sRqMXlTt6jvAL+Tnx1S7QOWGy0NT2MUvWEUzOGq3UGmEiPuYcFPmG0xpn2inENtDwKbX
         G3eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=jSUHUhvQKHt2NcsD5elnWtQJ/VSjmJ1bFtOiuf6xOjI=;
        b=qIce6/evpCVawbpbBdRslrs5gouXJ3lmTJKuOmtsDgQkWAiLEMcZqFz2tZGjA2QBjL
         mtLi5OzhdZFFFEucLFB7o/dBh6yov2fUkYZxrkxxOUs7Ey+oghAxrMLMxZJestjzKeKY
         cMbAESPC/t82ImX3yCz8M6JodH+chO/tBc4kkkP1edNNLCcqBPDoE90TzCVxteTQndmY
         4/PPAT4vX+d+zPs/JE45QpujWhQA/NuQ6VFAqKJ1ocT8IVOR5EBfwGktYR8mglIYL5K4
         oOOHwG6vusuKusb//T24wgxVrSuQTQiCEvXWc/UZ6Kf2dXyyreZf7EusEpzkaoFGVl5T
         Pehw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id i11si195939edf.5.2020.08.25.03.20.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 03:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 07PAK89j028514
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Aug 2020 12:20:08 +0200
Received: from [167.87.131.58] ([167.87.131.58])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07PAK6G2030271;
	Tue, 25 Aug 2020 12:20:07 +0200
Subject: Re: [PATCH-set] pyjailhouse: config_parser - jailhouse cell linux
 throws an error
To: "contact....@gmail.com" <contact.thorsten@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
 <20200715212119.48052-8-andrej.utz@st.oth-regensburg.de>
 <0da1d517-ea14-07c7-05ff-9d529108ef87@web.de>
 <78f3909c-206d-46ba-813b-5dbe5872e7c2n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <335079f2-a73e-fad0-a446-4dc9d13f00d4@siemens.com>
Date: Tue, 25 Aug 2020 12:20:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <78f3909c-206d-46ba-813b-5dbe5872e7c2n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 25.08.20 10:37, contact....@gmail.com wrote:
> At the current head of the next branch, jailhouse cell linux throws=C2=A0=
 an
> error:
>=20
> Traceback (most recent call last):
> =C2=A0 File "tools/jailhouse-cell-linux", line 723, in <module>
> =C2=A0=C2=A0=C2=A0 config =3D config_parser.CellConfig(args.config.read()=
)
> TypeError: __init__() takes 1 positional argument but 2 were given
>=20
> Thorsten
>=20
> PS sorry for probably replying to the wrong patch-thread
>=20

No problem - thanks for reporting!

This comes from "pyjailhouse: config_parser: move parsing into class=20
methods". Does this help?

diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 4178d4e0..aab82a5e 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -720,7 +720,7 @@ except IOError as e:
 arch =3D resolve_arch(args.arch)
=20
 try:
-    config =3D config_parser.CellConfig(args.config.read())
+    config =3D config_parser.CellConfig.parse(args.config.read())
 except RuntimeError as e:
     print(str(e) + ": " + args.config.name, file=3Dsys.stderr)
     exit(1)

Then I will fold it into Andrej's commit.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/335079f2-a73e-fad0-a446-4dc9d13f00d4%40siemens.com.
